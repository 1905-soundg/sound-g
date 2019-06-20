class AdminsController < ApplicationController

	def index
	    @orders = Order.all
	end

end
