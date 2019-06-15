class CartsController < ApplicationController
	before_action :authenticate_user!
	def index
	 @carts = Cart.all
	 @user = current_user
	end

	def update
	 @cart = Cart.find(params[:id])
	 @cart.update(cart_params)
	 redrect_to user_carts_path
	end

	def destroy
	end

	def create
		@cart = Cart.new(cart_params)
	    @cart.user_id = current_user.id
	 if @cart.save
	 redrect_to('/')
	 else
	 render :index
	 end
    end

    private

    def cart_params
    	params.require(:cart).permit(:quantity, :product_id, :user_id)
    end

end
