class Address < ApplicationRecord

	belongs_to :user
	validates :postalcode,presence: true, length:{ is: 7 }
	validates :address,presence: true, length:{ in: 1..100 }
	validates :name,presence: true, length:{ in: 1..50 }


end
