class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@album = Product.new
	end

	def create
		@album = Product.new(product_params)
		@album.save
		redirect_to ('/')
	end

	def product_paerams
		params.require(:product).permit(:album, :image, :price, :stock_quantity, :sales_status,
			                            musics_attributes: [:id, :title, :track_number, :_destroy,
		                                discs_attributes: [:id, :disc_number, :_destroy,
		                                 ]])
	end
end
