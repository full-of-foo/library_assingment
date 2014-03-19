LibraryAssignment::Application.routes.draw do
  root  'static_pages#home'

  # static
  match '/help',   to: 'static_pages#help',     via: 'get'
  match '/about',  to: 'static_pages#about',    via: 'get'
  # user
  resources :users,       only: [:index, :show, :destroy]
  # admin
  resources :admins,      only: [:new, :create, :edit, :update]
  # customer
  resources :customers,   only: [:new, :create, :edit, :update]
  #session
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'customers#new',        via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

end
