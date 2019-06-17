class OrderDetailsController < ApplicationController

	def create
	  @order_detail = OrderDetail.new
	  @order_detail.save
	  redirect_to new_user_orders_path()
	end


	private

    def order_detail_params
    	params.require(:order_detail).permit(:order_id, :product_id, :quantity, :order_price)
    end

end
