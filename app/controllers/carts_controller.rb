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
	 @cart_datail = Cart.new(cart_params)
	 @cart.user_id = curret_user.id
	 if @cart.save
	 redrect_to('/')
	 else
	 render ('/users/sign_in')
	 end
    end

    private

    def cart_params
    	params.require(:cart).permit(:quantity)
    end

end
