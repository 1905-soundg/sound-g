class Label < ApplicationRecord

	has_many :products
	validates :label, presence: true


end
