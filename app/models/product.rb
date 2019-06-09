class Product < ApplicationRecord

	has_many :discs
	has_many :favorites
    has_many :reviews
    has_many :carts

    belongs_to :label
    belongs_to :genre
    belongs_to :order_detail

end
