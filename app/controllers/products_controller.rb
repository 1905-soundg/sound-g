class ProductsController < ApplicationController

	def show
		@product = Product.find(params[:id])
		@genre = @product.genre
		@label = @product.label
		@discs = @product.discs
		@reviews = @product.reviews

		@cart = Cart.new

		#商品の在庫数の変更機能
		@carts = Cart.where(product_id: @product.id)
		@temporary_quantity = @product.stock_quantity - view_context.get_quantity(@carts)

		@review = Review.new




	end

	def index
		@products = Product.page(params[:page]).reverse_order.per(40)
	end

	protected

	def product_params
	  	params.require(:product).permit(:album, :genre_id, :label_id, :image, :price, :stock_quantity, :sales_status,
			                            discs_attributes: [:id, :disc_number, :product_id, :_destroy,
			                            musics_attributes: [:id, :title, :track_number, :disc_id, :artist_id, :_destroy,
		                                 ]])
	end
end
