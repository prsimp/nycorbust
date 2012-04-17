Nycorbust::Application.routes.draw do

  resources :categories
  resources :items
  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]

  match '/login'  => 'sessions#new'
  match '/logout' => 'sessions#destroy'
  match '/admin'  => 'pages#admin'

  root to: 'pages#home'

end
