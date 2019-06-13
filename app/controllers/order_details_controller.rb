class OrderDetailsController < ApplicationController

	def create
	end


	private
    
    def order_detail_params
    	params.require(:order_detail).permit(:order_id, :product_id, :quantity, :order_price)
    end

end
