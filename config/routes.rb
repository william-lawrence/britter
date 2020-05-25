Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  resources :quips
  root 'quips#index'
end
