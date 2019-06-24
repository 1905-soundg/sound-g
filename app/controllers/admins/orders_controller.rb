class Admins::OrdersController < ApplicationController

	def update
	 @order = Order.find(params[:id])
	 @order.update!(order_params)
	 redirect_to admins_path
	end

	def number?(str)
	  	Integer(str)
	  	track_number
	  rescue ArgumentError
	  	false
	end

	private

	def order_params
		params.require(:order).permit(:user_id, :subtotal_price, :fee, :address, :order_status)
	end

	def params_int(order_params)
		oder_params.each do |key,value|
			if integer_string?(value)
				order_params[key] = value.to_i
			end
		end
	end


end
