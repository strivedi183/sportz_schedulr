SportzSchedulr::Application.routes.draw do
  root 'home#index'

  resources :users do
    resources :meetups
  end

  # logging in, logging out
  get     '/login'    => 'sessions#new',     :as => 'login'
  post    '/login'   => 'sessions#create'
  delete  '/login' => 'sessions#destroy', :as => 'logout'

  # /admin/dashboard
  namespace :admin do
    get '/' => 'dashboard#index', :as => '/'

    resources :users, :meetups, :venues, :events
  end
end
