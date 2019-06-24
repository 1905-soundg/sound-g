class Review < ApplicationRecord

	belongs_to :user
	belongs_to :product
	validates :review,presence: true, length:{ in: 1..200 }



end
