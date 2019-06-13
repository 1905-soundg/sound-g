class Disc < ApplicationRecord

	belongs_to :product, inverse_of: :discs

	has_many :musics, inverse_of: :disc
    accepts_nested_attributes_for :musics, reject_if: :all_blank, allow_destroy: true


end
