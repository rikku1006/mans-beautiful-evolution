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

  def show
    @product_review = ProductReview.find(params[:id])
  end

  def edit
    @product_review = ProductReview.find(params[:id])
  end

  def update
    @product_review = ProductReview.find(params[:id])
    if @product_review.update(product_review_params)
      redirect_to product_review_path(@product_review.id)
    else
      render :edit
    end
  end


  private

  def product_review_params
    params.require(:product_review).permit(:image, :product_name, :category_id, :review_comment).merge(user_id: current_user.id)
  end
end
