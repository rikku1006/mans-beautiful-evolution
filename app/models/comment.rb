class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product_review

  validates :text,    presence: true
end
