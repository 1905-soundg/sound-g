class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def home
	end

	def index
	    @orders = Order.page(params[:page]).reverse_order.per(20)
	end


end
