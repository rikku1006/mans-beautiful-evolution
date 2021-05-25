class ProductReview < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :product_name
    validates :category_id,         numericality: { other_than: 1 }
    validates :review_comment
  end
end
