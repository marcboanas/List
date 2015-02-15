require 'api_constraints'

Rails.application.routes.draw do
  
  #Root Path
  root 'static_pages#home'
  
  #Sessions Routes
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  #Users Routes
  get 'signup' => 'users#new'
  resources :users do
    resources :lists
  end

  #Account Verifications
  resources :account_verifications, only: [:edit]
  
  #Password Resets
  resources :passwords_resets, only: [:new, :create, :edit, :update]
  
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constaints:ApiConstraints.new(version: 1, default: true) do
      post 'facebook' => 'users#facebook'
      post 'signup' => 'users#signup'
      post 'signin' => 'users#signin'
      post 'reset_password' => 'users#reset_password'
      get 'get_token' => 'users#get_token'
      get 'clear_token' => 'users#clear_token'
      match "*path", to: "api#page_not_found", via: :all
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
