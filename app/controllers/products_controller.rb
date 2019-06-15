class ProductsController < ApplicationController

	def show
		@product = Product.find(params[:id])
<<<<<<< HEAD
		@cart = Cart.new
=======
		@genre = @product.genre
		@label = @product.label
		@discs = @product.discs
		@cart = Cart.new
		@review = Review.new
		@reviews = Review.all
		@user = current_user.id
>>>>>>> a3a637c34969b05c884e1e94a382189fb4ea6e95
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

	end
