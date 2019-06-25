class OrderDetail < ApplicationRecord

	belongs_to :order



	belongs_to :product

    def product
        Product.unscoped{super}
    end

end
