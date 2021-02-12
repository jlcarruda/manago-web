class DeckCard < ApplicationRecord
	# acts_as_taggable

	belongs_to :deck
	belongs_to :card
end