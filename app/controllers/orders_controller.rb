class OrdersController < ApplicationController
	def new
	end

	def create
	end

	def success
	end

	private

	def order_params
		params.require(:order).permit(:user_id, :subtotal_price, :fee, :postalcode, :address, :last_name, :first_name, :order_status)
	end

end
