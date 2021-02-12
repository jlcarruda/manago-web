class Card < ApplicationRecord
	acts_as_taggable

	has_many :deck_cards
	has_many :decks, through: :deck_cards
end
