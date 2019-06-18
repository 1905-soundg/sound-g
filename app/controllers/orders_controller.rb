class OrdersController < ApplicationController
	def new
	 @carts = Cart.where(user_id: current_user.id)
	 @fee = 500
	 @total = view_context.get_price(@carts)+@fee
	 @order = Order.new
	 @user = current_user
	 @address = Address.new
	 @addresses = Address.where(user_id: current_user.id)
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
