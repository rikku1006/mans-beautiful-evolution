class ProductReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product_review, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @product_review.comments.includes(:user)
  end

  def edit
  end

  def update
    if @product_review.update(product_review_params)
      redirect_to product_review_path(@product_review.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @product_review.destroy
  end


  private

  def product_review_params
    params.require(:product_review).permit(:image, :product_name, :category_id, :review_comment).merge(user_id: current_user.id)
  end

  def set_product_review
    @product_review = ProductReview.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user == @product_review.user
  end

end
