class OrdersController < ApplicationController
	def new
	 @carts = Cart.where(user_id: current_user.id)
	 @fee = 500
	 @order = Order.new
	 @user = current_user
	 @address = Address.new
	 @addresses = Address.where(user_id: current_user.id)
	end

	def create
	@user = current_user
	 @order = Order.new(order_params)
	 @order.user_id = current_user.id
		 if @order.address == @user.address
			 @order.address = @order.user.address
			 @order.last_name = @order.user.last_name
			 @order.first_name = @order.user.first_name
			 @order.postalcode = @order.user.postalcode
		 else
			 ship_address = @order.address.match(/\s/).post_match.to_s
			 address_id = @order.address.match(/\s/).pre_match.to_i
			 @order.address = ship_address
			 @order_address = Address.find(address_id)
			 @order.last_name = @order_address.name
			 @order.first_name = @order_address.name
			 @order.postalcode = @order_address.postalcode
		end
	 @order.save
	 redirect_to success_user_orders_path()
	end

	def success
	end

	private

	def order_params
		params.require(:order).permit(:user_id, :subtotal_price, :fee, :address, :order_status)
	end

end
