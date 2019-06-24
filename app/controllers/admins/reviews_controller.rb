class Admins::ReviewsController < ApplicationController

  def show
      @reviwes = Review.all
      @reviews = Review.find(params[:id])
  end

  def edit
      @review = Review.find(params[:id])
      @user = @review.user
      @product = @review.product
  end

  def post
      @review = Review.find(params[:id])
  end

  def update
      @review = Review.find(params[:id])
      if @review.update!(review_params)
        flash[:notice] = "レビューを編集しました。"
         redirect_to edit_admins_product_review_path(@review.id)
      else
        flash[:alert] = "レビューの編集に失敗しました。"
        render :edit
      end

  end

  def destroy
		  @review = Review.find(params[:id])
      @product = @review.product
      if @review.destroy
        flash[:alert] = "レビューを削除しました"
         redirect_to admins_product_path(@product.id)
      else
        flash[:alert] = "レビューの削除に失敗しました。"
        render :edit
      end
	end

  private

  def review_params
      params.require(:review).permit(:review, :product_id, :user_id)
  end


end
