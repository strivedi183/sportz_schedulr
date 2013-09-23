SportzSchedulr::Application.routes.draw do
  root 'home#index'

  resources :users

  # logging in, logging out
  get '/login'    => 'sessions#new',     :as => 'login'
  post '/login'   => 'sessions#create'
  delete '/login' => 'sessions#destroy', :as => 'logout'

  # /admin/dashboard
  namespace :admin do
    get '/' => 'dashboard#index', :as => '/'
  end


  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
