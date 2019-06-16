class CartsController < ApplicationController
	before_action :authenticate_user!
	def index
	 @carts = Cart.all
<<<<<<< HEAD
	end

	def update
=======
	 @user = current_user
	end

	def update
	 @cart = Cart.find(params[:id])
<<<<<<< HEAD
	 binding.pry
	 @cart.update(cart_params)
	 redrect_to user_carts_path
>>>>>>> a3a637c34969b05c884e1e94a382189fb4ea6e95
=======

>>>>>>> master
	end

	def destroy
	 cart = Cart.find(params[:id])
	 cart.destroy
	 redirect_to user_carts_path()
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
