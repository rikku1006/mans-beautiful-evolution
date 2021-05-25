require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'textが、あれば投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿ができない場合' do
      it 'textが、空だと投稿できない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userに、紐付いていなければ投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'product_reviewに、紐付いていなければ投稿できない' do
        @comment.product_review = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Product review must exist")
      end
    end
  end
end
