class CreateProductReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :product_reviews do |t|
      t.string :product_name,          null: false
      t.integer :category_id,          null: false
      t.text :review_comment,          null: false
      t.references :user,              foreign_key: true

      t.timestamps
    end
  end
end
