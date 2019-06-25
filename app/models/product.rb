class Product < ApplicationRecord

    acts_as_paranoid


	has_many :favorites, dependent: :destroy
    has_many :reviews
    has_many :carts, dependent: :destroy
    has_many :discs, inverse_of: :product

    accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

    belongs_to :label
    belongs_to :genre

    attachment :image


    validates :stock_quantity, numericality: {greater_than_or_equal_to: 0}


    enum sales_status:{販売中: 0, 販売中止: 1,}



def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
end

end
