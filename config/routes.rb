Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  resources :users
  resources :votes
  resources :works
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
