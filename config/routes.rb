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
  delete 'topics/:id' => 'topics#destroy', as: :destroy_topic
  get 'create_posts/:id'    => 'posts#new', as: :create_post
  post 'posts/:id'    => 'posts#create', as: :add_post
  get 'create_topic'  => 'topics#new', as: :create_topic
  post 'topics'   => 'topics#create'


  resources :users

end
