require 'subdomain'
Bookafy::Application.routes.draw do
  
  resources :working_days, :only => [:index, :show, :update, :edit]
  resources :customers do
      collection { post :import }
  end

  resources :appointments

  match "/calendar", :to => "calendar#index", :as => "calendar", via: :get
  resources :events

  resources :work_hours

  match 'auth/:provider/callback', to: 'sessions#create', via: :get
  match 'auth/failure', to: redirect('/'), via: :get
  match 'signout', to: 'sessions#destroy', as: 'signout', via: :get
  
  resources :services  
  resources :categories
  resources :workers
  resources :team_leaders
  resources :clients
  resources :subscriptions
  resources :plans
  devise_for :users
  match "/expired", :to => "expires#index", :as => "expires", via: :get
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  match "/settings", :to => "settings#index", :as => "setting", via: :get
  constraints(Subdomain) do
    match '/' => "customers#new", via: :get #necessary to be just above the root route
  end 
  root :to => "home#index"
  match "/", :to => "home#index", :as => "home", via: :get 

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
