class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '導入液' },
    { id: 3, name: '化粧水' },
    { id: 4, name: '美容液' },
    { id: 5, name: '乳液' },
    { id: 6, name: 'クリーム' },
    { id: 7, name: 'パック' },
    { id: 8, name: 'ボディークリーム' }
  ]

  include ActiveHash::Associations
  has_many :product_reviews
end