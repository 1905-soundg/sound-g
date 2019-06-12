class OrderDetailsController < ApplicationController

	def create
	end


	private
    
    def order_detail_params
    	params.require(:order_detail).permit
    end

end
