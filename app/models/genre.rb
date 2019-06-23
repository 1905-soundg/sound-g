class Genre < ApplicationRecord

	has_many :products
	validates :genre, presence: true, length:{ in: 1..50 }


end
