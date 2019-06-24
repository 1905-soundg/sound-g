class Label < ApplicationRecord

	has_many :products
	validates :label, presence: true, length:{ in: 1..100 }


end
