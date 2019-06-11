require 'scryfall/cards'

class DeckBuilderService

	def initialize(text)
		@deck_text = text if text.present?
		@tags_symbols = ['@', '#']
	end

	def process
		return false unless @deck_text.present?
		raw_array = @deck_text.split("\r\n")
		compiled_list = []
		failures = []
		# @deck = Deck.new
		raw_array.each_with_index do |card_row, index|
			info = normalize card_row
			card = get_card(info)
			if card.present?
				compiled_list << card
			else
				failures << { i: index, info: info }
			end
		end
		compiled_list
	end

	private

	def normalize(row)
		info = (row.strip).split(" ")
		quantity = info[0].to_i != 0 ?
			info[0] :
			1
		name_array = info.select do |v|
			(@tags_symbols + [*1..9]).map(&:to_s).include?(v[0]) == false
		end
		name = name_array.join(" ")
		tags = info.select do |v|
			@tags_symbols.include? v[0]
		end

		tags = tags.map { |e| e[1..-1] }
		return {quantity: quantity, name: name, tags: tags}
	end

	def get_card(info)
		card = Card.where(normalized_name: info[:name].upcase).first
		unless card.present?
			resp = Scryfall::Cards.named_exact info[:name], to_struct: true

			return if resp.object == "error"

			card = Card.create(
				uuid: resp.id,
				name: resp.name,
				uri: resp.uri,
				normalized_name: resp.name.upcase,
				image_url: resp.image_uris.normal,
				scryfall_uri: resp.scryfall_uri,
				cmc: resp.cmc,
				card_type: resp.type_line,
				object: resp.to_s
			)
		end

		card.tag_list = info[:tags]
		{ card: card, quantity: info[:quantity] }
	end
end