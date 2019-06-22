class Admins::ReviewsController < ApplicationController

  def show
      @reviwes = Review.all
      @reviews = Review.find(params[:id])
  end

  def edit
      @review = Review.find(params[:id])
      @user = @review.user
  end

  def post
      @review = Review.find(params[:id])
  end

  def update
      @review = Review.find(params[:id])
      if @review.update!(review_params)
         redirect_to edit_admins_product_review_path(@review.id), notice: "You have updated review successfully."
      else
        render :edit
      end

  end

  def destroy
		  @review = Review.find(params[:id])
      @product = @review.product
		  @review.destroy
		  redirect_to admins_product_path(@product.id)
	end

  private

  def review_params
      params.require(:review).permit(:review, :product_id, :user_id)
  end


end
