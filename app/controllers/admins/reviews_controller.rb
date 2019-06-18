class Admins::ReviewsController < ApplicationController

  def show
      @reviwes = Review.all
      @reviews = Review.find(params[:id])
  end

  def edit
      @review = Review.find(params[:id])
  end

  def update
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      @review.save
      redirect_to ('/')
  end

  def destroy
		  @review = Review.find(params[:id])
		  @review.destroy
		  redirect_to ('/')
	end
end
