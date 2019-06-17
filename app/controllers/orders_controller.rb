class OrdersController < ApplicationController
	def new
	 @carts = Cart.where(user_id: current_user.id)
	 @fee = 500
	end

	def create
	 @order = Order.new
	 @order.save
	 redirect_to success_user_orders_path()
	end

	def success
	end

	private

	def order_params
		params.require(:order).permit(:user_id, :subtotal_price, :fee, :postalcode, :address, :last_name, :first_name, :order_status)
	end

end
