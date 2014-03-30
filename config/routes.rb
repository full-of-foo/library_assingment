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
  resources :books,        only: [:index, :show] do
    match 'book_stocks', to: 'book_stocks#create_or_destroy_multiple', via: 'post'
  end
  # purchases
  resources :purchases
  # shopping cart
  match '/cart/show',            to: 'shopping_cart#show',   via: 'get'
  match '/cart/clear',           to: 'shopping_cart#clear',  via: 'get'
  match '/cart/add/:book_id',    to: 'shopping_cart#add',    via: 'get', as: 'cart_add'
  match '/cart/remove/:book_id', to: 'shopping_cart#remove', via: 'get', as: 'cart_remove'
  #session
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'customers#new',        via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

end
