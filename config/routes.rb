TestApp::Application.routes.draw do

  get '/users/:user_id/locations/:id' => 'locations#show', :as => 'user_location'
  post '/users/:user_id/locations/' => 'locations#create', :as => 'create_user_location'
  delete '/users/:user_id/locations/:id' => 'locations#destroy', :as => 'destroy_location'

  get 'users/:user_id' => 'users#show', :as => 'user'
  get 'users/new' => 'users#new', :as => 'new_user'
  get 'users/:user_id/edit' => 'users#edit', :as => 'edit_user'
  post 'users' => 'users#create'
  put 'users/:user_id' => 'users#update'
  delete 'users/:user_id' =>'users#destroy'
  
  controller :sessions do 
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  root to: 'sessions#new'

  # resources :users do
  #   resources :locations
  # end


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
