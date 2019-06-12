class CartsController < ApplicationController
	before_action :authenticate_user!
	def index
	 @carts = Cart.all
	end

	def update
	end

	def destroy
	end

	def create
	    product = Product.find(params[:product_id])
		cart = current_user.cart.new(cart_params)
	 if cart.save
	 redrect_to('/')
	 else
	 render ('/users/sign_in')
	 end
    end

    private

    def cart_params
    	params.require(:cart).permit(:quantity, :product_id, :user_id)
    end

end
