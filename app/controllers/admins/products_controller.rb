class Admins::ProductsController < ApplicationController

    def index
    	@products = Product.all
    end

    def show
  		@product = Product.find(params[:id])
  		@genre = @product.genre
  		@label = @product.label
  		@discs = @product.discs
      @reviews = @product.reviews
  		@review = Review.new
  	end


	  def new
	 	  @product = Product.new
	   	@disc = @product.discs.build
	  	@music = @disc.musics.build
	  end

	  def create
		  @product = Product.new(product_params)
	  	@product.save
		  redirect_to ('/')
	  end


	protected

	def product_params
		params.require(:product).permit(:album, :genre_id, :label_id, :image, :price, :stock_quantity, :sales_status,
			                            discs_attributes: [:id, :disc_number, :product_id, :_destroy,
			                            musics_attributes: [:id, :title, :track_number, :disc_id, :artist_id, :_destroy,
		                                 ]])
	end
end
