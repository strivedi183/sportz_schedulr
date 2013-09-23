SportzSchedulr::Application.routes.draw do
  root 'home#index'

  # /admin/dashboard
  namespace :admin do
    get '/' => 'dashboard#index', :as => '/'
    # resources :dashboard, :as => '/'
  end


  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
