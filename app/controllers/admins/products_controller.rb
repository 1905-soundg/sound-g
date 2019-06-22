class Admins::ProductsController < ApplicationController

    def index
    	@products = Product.page(params[:page]).reverse_order.per(20)
    end

    def show
  		@product = Product.find(params[:id])
  		@genre = @product.genre
  		@label = @product.label
  		@discs = @product.discs
        @reviews = @product.reviews
  	end


  	def edit
  		@prduct = Product.find(params[:id])
  		@product = Product.find(params[:id])
  		@genre = @product.genre
  		@label = @product.label
  		@discs = @product.discs
        @reviews = @product.reviews
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

	  def update
	  	@product = Product.find(params[:id])
	  	@product.update!(product_params)
	  	redirect_to admins_product_path(@product)
	  end

	  def destroy
	  	@product = Product.find(params[:id])
	  	@product.destroy
	  	redirect_to admins_products_pahs
	  end


	protected

	def product_params
		params.require(:product).permit(:album, :genre_id, :label_id, :image, :price, :stock_quantity, :sales_status,
			                            discs_attributes: [:id, :disc_number, :product_id, :_destroy,
			                            musics_attributes: [:id, :title, :track_number, :disc_id, :artist_id, :_destroy,
		                                 ]])
	end
end
