Rails.application.routes.draw do
  resources :quips
  root 'quips#index'
end
