Nycorbust::Application.routes.draw do

  resources :categories, only: [:index, :show]
  resources :items, only: [:index, :show]

  namespace :admin do
    resources :categories, except: [:show, :destroy]
    resources :items, except: :show
  end

  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :contact, only: [:new, :create ]


  match '/login'  => 'sessions#new'
  match '/logout' => 'sessions#destroy'
  match '/admin'  => 'pages#admin'
  match '/contact' => 'contact#new'

  root to: 'pages#home'

end
