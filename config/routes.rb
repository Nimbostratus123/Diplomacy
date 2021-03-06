Diplomacy::Application.routes.draw do
	resources :sessions, :only => [:new, :create, :destroy]
	
  # get "sessions/new"
  # 	
  # get "users/new"
  # 
  # get "pages/home"
  # 
  get 'messages/index'
  get 'messages/sent'
  
  get 'users/:id', to: 'users#show', as: 'show'
  
  get 'users/:id/update_bio', to: 'users#update_bio', as: 'bio'

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
     resources :units do
       member do
         get 'new'
         post 'create'
		 
		 get 'edit'
		 put 'update'
		 put 'place'
		 delete 'destroy'
       end
	   
	   collection do
		   get 'unplaced'
	   end
     end
	 
	 resources :messages do
		 member do
			post 'create'
			
			post 'seen'
			
		 end
		 
		 collection do
			 get 'index'
			 get 'sent'
			 get 'read'
		 end
	 end
	 
	 resources :users do
		 member do
			 
			 get 'show'
			 delete 'destroy'
			 
			 get 'new'
			 post 'create'
			 
			 get 'edit'
			 put 'update'
			 
			 put 'update_bio'
			 
			 
		 end
		 
		 collection do
			 get 'index'
		 end
	 end

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
	match '/join', :to => 'users#new'
	
	match '/signin', :to => 'sessions#new'
	
	match '/signout', :to => 'sessions#destroy'
	
	match '/map', :to => 'pages#map'
	
	match '/players', :to => 'users#index'
	
	match '/new_units', :to => 'units#unplaced'

	
	
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
