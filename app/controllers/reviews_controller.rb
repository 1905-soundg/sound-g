class ReviewsController < ApplicationController


  def show
      @reviws = Review.all
      @reviews = Review.find(params[:id])
  end

  def create
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      @review.save
      redirect_back(fallback_location: root_path)
  end

  def edit
      @review = Review.find(params[:id])
  end

  def update
      @review = Review.find(params[:id])
      @review.update(review_params)
      redirect_to admins_product_path(@review.product_id)
  end

  def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_back(fallback_location: root_path)
  end

  private
  def review_params
      params.require(:review).permit(:review, :product_id)
  end

end
