SportzSchedulr::Application.routes.draw do
  root 'home#index'

  resources :events,  :only => [:index, :show]
  resources :meetups, :only => [:new, :create]

  resources :users do
    resources :meetups
  end

  # logging in, logging out
  get     '/login' => 'sessions#new',     :as => 'login'
  post    '/login' => 'sessions#create'
  delete  '/login' => 'sessions#destroy', :as => 'logout'

  # /admin/dashboard
  namespace :admin do
    get '/' => 'dashboard#index', :as => '/'
    resources :users, :meetups, :venues, :events
  end

  # api/
  namespace :api do
    resources :users,   :only => [:index, :show]
    resources :venues,  :only => [:show]
  end

  # routes for omniauth facebook authentication
  match 'auth/:provider/callback',  :to => 'sessions#create_with_facebook', :as => 'login_with_facebook', :via  => :all
  match 'auth/failure',             :to => 'sessions#new', :as   =>  '/',   :via => [:get, :post]

  # for Jasmine testing
  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)

end
