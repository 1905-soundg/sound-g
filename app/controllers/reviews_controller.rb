  class ReviewsController < ApplicationController


  def show
      @reviws = Review.all
      @reviews = Review.find(params[:id])
  end

  def create
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      @review.save
      redirect_to ('/')
  end

  private
  def review_params
      params.require(:review).permit(:review, :product_id)
  end

end
