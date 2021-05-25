Rails.application.routes.draw do
  devise_for :users
  root to: "product_reviews#index"
  resources :product_reviews do
    resources :comments, only: [:create]
  end
end
