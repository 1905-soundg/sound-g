class Admins::ReviewsController < ApplicationController

  def show
      @reviwes = Review.all
      @reviews = Review.find(params[:id])
  end

  def edit
      @review = Review.find(params[:id])
  end

  def post
     @review = Review.find(params[:id])
  end

  def update
      @review = Review.find(params[:id])
      @review.update(review_params)
      redirect_back(fallback_location: root_path)

  end

  def destroy
		  @review = Review.find(params[:id])
		  @review.destroy
		  redirect_back(fallback_location: root_path)
	end
end
