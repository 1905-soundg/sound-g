class Artist < ApplicationRecord

	has_many :musics
	validates :artist, presence: true, length:{ in: 1..50 }

end
