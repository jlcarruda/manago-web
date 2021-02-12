class DecksController < BaseController
	def create
		if params[:deck_text].present?
			@raw = params[:deck_text]
			@list = DeckBuilderService.new(@raw).process
		end
	end

	private

	def model
		Deck
	end

	def object_params
		params.fetch(:deck, {}).permit(:deck_text, :name)
	end
end