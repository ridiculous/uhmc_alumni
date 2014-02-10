UhmcAlumni::Application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"

  # login
  get "log_in" => "sessions#new", :as => "log_in"
  post "log_in" => "sessions#create"
  #
  get "create_user" => "users#new", :as => "create_user"
  get "edit_password" => "users#edit_password", :as => "edit_password"
  get "search" => "alumnis#index", :as => "search"

  resources :users
  resources :sessions

  resources :alumnis do
    resources :schools
    resources :employments
  end


  #controller :users do
  # scope '/users' do
  #  match "/sign_up", :to => "users#sign_in"
  #end
  #end
  match "sessions/confirmation", :to => "sessions#confirmation"
  match "users/update_password", :to => "users#update_password"
  match "users/edit_password/:id", :to => "users#edit_password"
  match "alumnis/summary/:id(.:format)", :to => "alumnis#summary"

  root :to => "alumnis#index"

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
