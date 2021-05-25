class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      redirect_to product_review_path(@comment.product_review)
    else
      @product_review = @comment.product_review
      @comments = @product_review.comments
      render "product_reviews/show"
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_review_id: params[:product_review_id])
  end
end
