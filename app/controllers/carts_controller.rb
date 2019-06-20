class CartsController < ApplicationController
	before_action :authenticate_user!

	def index
	 @carts = Cart.where(user_id: current_user.id)
	 @user = current_user
	end

	def update
	 @cart = Cart.find(params[:id])
	 @cart.update!(cart_params)
	 redirect_to user_carts_path(@cart.user_id)
	end

	def destroy
	 cart = Cart.find(params[:id])
	 cart.destroy
	 redirect_to user_carts_path()
	end
	
	def create
		current_cart(params[:cart][:product_id])
	    @cart.quantity += params[:cart][:quantity].to_i
	    @cart.user_id = current_user.id
	    @cart.save
	    redirect_to ('/')
    end


    private


    def cart_params
    	params.require(:cart).permit(:quantity, :product_id, :user_id)
    end

end
