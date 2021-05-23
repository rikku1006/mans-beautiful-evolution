class ProductReviewsController < ApplicationController
  def index
    @product_review = ProductReview.all.order('created_at DESC')
  end

  def new
    @product_review = ProductReview.new
  end

  def create
    @product_review = ProductReview.new(product_review_params)
    if @product_review.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def product_review_params
    params.require(:product_review).permit(:image, :product_name, :category_id, :review_comment).merge(user_id: current_user.id)
  end
end
