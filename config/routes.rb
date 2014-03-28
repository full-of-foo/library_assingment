LibraryAssignment::Application.routes.draw do
  root  'static_pages#home'

  # static
  match '/help',   to: 'static_pages#help',     via: 'get'
  match '/about',  to: 'static_pages#about',    via: 'get'
  # user
  resources :users,       only: [:index, :destroy]
  # admin
  resources :admins,      only: [:new, :create, :edit, :update, :show]
  # customer
  resources :customers,   only: [:new, :create, :edit, :update, :show] do
    # address
    resources :addresses, only: [:new, :create, :edit, :update, :destroy]
  end
  # books
  resources :books,       only: [:index, :show]

  #session
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'customers#new',        via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

end
