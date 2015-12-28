Rails.application.routes.draw do

  root                       'static_pages#index'
  get 'login'             => 'sessions#new'
  post 'login'            => 'sessions#create'
  delete 'logout'         => 'sessions#destroy'

  resources :clients, only: [:show, :new, :create, :update]

end
