class Music < ApplicationRecord

	belongs_to :disc, inverse_of: :musics

	belongs_to :artist
	validates :title, presence: true, length:{ in: 1..50 }


end
