require 'rails_helper'

RSpec.describe ProductReview, type: :model do
  before do
    @product_review = FactoryBot.build(:product_review)
  end

  describe '商品レビュー投稿' do
    context '投稿できる時' do
      it 'image、product_name、category_id、review_commentが存在すれば投稿できる' do
        expect(@product_review).to be_valid
      end
    end
    context '投稿できない時' do
      it 'imageが、空だと投稿できない' do
        @product_review.image = nil
        @product_review.valid?
        expect(@product_review.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが、空だと投稿できない' do
        @product_review.product_name = ''
        @product_review.valid?
        expect(@product_review.errors.full_messages).to include("Product name can't be blank")
      end
      it 'category_idが、空だと投稿できない' do
        @product_review.category_id = ''
        @product_review.valid?
        expect(@product_review.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが、1を選択すると投稿できない' do
        @product_review.category_id = 1
        @product_review.valid?
        expect(@product_review.errors.full_messages).to include("Category must be other than 1")
      end
      it 'review_commentが、空だと投稿できない' do
        @product_review.review_comment = ''
        @product_review.valid?
        expect(@product_review.errors.full_messages).to include("Review comment can't be blank")
      end
    end
  end
end