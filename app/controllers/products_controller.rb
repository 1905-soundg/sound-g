class ProductsController < ApplicationController

	def show
		@product = Product.find(params[:id])
	end

	def create
		@product = Product.find(params[:id])
		@cart = Cart.new(cart_params)
		@cart.user_id = current_user.id
		@cart.product_id = @Product.id
		@cart.save
	end

	def index
		@products = Product.all
	end

	protected

	def product_params
		params.require(:product).permit(:album, :genre_id, :label_id, :image, :price, :stock_quantity, :sales_status,
			                            discs_attributes: [:id, :disc_number, :product_id, :_destroy,
			                            musics_attributes: [:id, :title, :track_number, :disc_id, :artist_id, :_destroy,
		                                 ]])
	end

	def create_params
		params.require(:cart).permit(:user_id, :product_id, :quanttity)
	end
end
