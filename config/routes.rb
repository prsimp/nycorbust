Nycorbust::Application.routes.draw do

  resources :categories
  resources :items
  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :contact, only: [:new, :create ]

  match '/login'  => 'sessions#new'
  match '/logout' => 'sessions#destroy'
  match '/admin'  => 'pages#admin'
  match '/contact' => 'contact#new'

  root to: 'pages#home'

end
