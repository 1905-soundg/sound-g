class Order < ApplicationRecord

	belongs_to :user

	def user
        User.unscoped{super}
    end

	has_many :order_details

	enum order_status:{受付: 0, 準備中: 1, 出荷済: 2,}


end
