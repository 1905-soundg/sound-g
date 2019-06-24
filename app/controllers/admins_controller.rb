class AdminsController < ApplicationController

	def home
	end

	def index
	    @orders = Order.page(params[:page]).reverse_order.per(20)
	end


end
