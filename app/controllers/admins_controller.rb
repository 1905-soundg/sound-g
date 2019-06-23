class AdminsController < ApplicationController

	def index
	    @orders = Order.page(params[:page]).reverse_order.per(20)
	end

end
