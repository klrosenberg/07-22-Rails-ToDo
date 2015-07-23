Rails.application.routes.draw do
  
  # root 'main#main'
  get "home" => 'main#main'
  
  get "users/login" => 'users#login', :as => "login"
  
  ### resources :users
  
  get "users" => 'users#index', :as => "users"
  
  delete "users/:id" => 'users#destroy'

  put "users/:id" => 'users#update'
  
  get "users/:id/edit" => 'users#edit', :as => "edit_user"
  
  post "users" => 'users#create', :as => "create_user"
  
  get "users/new" => 'users#new', :as => "new_user"
  
  get "users/:id" => 'users#show', :as => "user"
  
  ### resources :tasks
  
  get "tasks" => 'tasks#index', :as => "tasks"
  
  delete "tasks/:id" => 'tasks#destroy'

  put "tasks/:id" => 'tasks#update'
  
  get "tasks/:id/edit" => 'tasks#edit', :as => "edit_task"
  
  post "tasks" => 'tasks#create', :as => "create_task"
  
  get "tasks/new" => 'tasks#new', :as => "new_task"
  
  get "tasks/:id" => 'tasks#show', :as => "task"
  
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
