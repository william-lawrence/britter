Rails.application.routes.draw do
  devise_for :users , :controllers => {registrations: 'registrations'}
  devise_for :models
  resources :quips
  root 'quips#index'
end
