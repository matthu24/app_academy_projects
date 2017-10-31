Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :plans do
    resources :comments, only: [:create,:new]
  end
  resources :comments, only: [:destroy]
  resource :session


end
