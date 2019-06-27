class ReviewsController < ApplicationController


  def show
      @reviws = Review.all
      @reviews = Review.find(params[:id])
  end

  def create
      @review = Review.new(review_params)
      @review.user_id = current_user.id

      if @review.save
  			flash[:notice] = "レビューを投稿しました。"
  		  redirect_back(fallback_location: root_path)
  		else
  			flash[:alert] = "レビューを入力してください。"
  			redirect_back(fallback_location: root_path)
  		end
  end

  private
  def review_params
      params.require(:review).permit(:review, :product_id)
  end

end
