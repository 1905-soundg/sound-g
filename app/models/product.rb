class Product < ApplicationRecord

	has_many :favorites
    has_many :reviews
    has_many :carts
    has_many :discs, inverse_of: :product

    accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

    belongs_to :label
    belongs_to :genre

    attachment :image

end
