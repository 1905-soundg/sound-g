class Disc < ApplicationRecord

	has_many :musics

	belongs_to :product

end
