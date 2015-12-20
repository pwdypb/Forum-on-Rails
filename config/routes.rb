Rails.application.routes.draw do
  get 'sessions/new'

  # get 'users/new'

  root to: 'static_pages#home'

  get 'signup'  => 'users#new'
  get 'show'    => 'users#show'
  post 'users/edit/:id'   => 'users#edit', as: :edit_user
  get 'login'   => 'sessions#new'
  post 'login'  => 'sessions#create'
  delete 'logout'=> 'sessions#destroy'
  get 'topics'  => 'topics#show', as: :topics
  get 'posts/:id'   => 'posts#show', as: :posts
  delete 'posts/:id'  => 'posts#destroy', as: :destroy_post
  get 'create_posts/:id'    => 'posts#new', as: :create_post
  post 'posts/:id'    => 'posts#create', as: :add_post


  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
