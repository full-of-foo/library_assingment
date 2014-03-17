LibraryAssignment::Application.routes.draw do
  root  'static_pages#home'

  # static
  match '/help',   to: 'static_pages#help',  via: 'get'
  match '/about',  to: 'static_pages#about', via: 'get'
  # user
  match '/signup', to: 'users#new',          via: 'get'
  resources :users, only: [:index, :create, :show, :update, :delete]

end
