Rails.application.routes.draw do
  devise_for :users
  root to: "product_reviews#index"
  resources :product_reviews
end
