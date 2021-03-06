Feminine::Application.routes.draw do
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy] do
      resources :comments
      member do
        get :vote_up
      end
  end
  resources :relationships, only: [:create, :destroy]

  root to: 'static_pages#home'
  
  match '/feed',  to: 'static_pages#feed'
  match '/users',  to: 'users#index'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/help',  to: 'static_pages#help'
  
  match '/health',  to: 'static_pages#health'
  match '/beauty',  to: 'static_pages#beauty'
  match '/fashion',  to: 'static_pages#fashion'
  match '/living',  to: 'static_pages#living'
  match '/health',  to: 'static_pages#health'
  match '/marriage',  to: 'static_pages#marriage'
  match '/mums',  to: 'static_pages#mums'
  match '/gossip',  to: 'static_pages#gossip'
  match '/recipes',  to: 'static_pages#recipes'
  match '/shopping',  to: 'static_pages#shopping'
  
  match '/signout', to: 'sessions#destroy', via: :delete
  match 'tagged' => 'microposts#tagged', :as => 'tagged'

  get "static_pages/help"
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
