Rails.application.routes.draw do
  root to: "homepages#index"

  resources :homepages, only: [:index]
  resources :users
  resources :votes
  resources :works
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
