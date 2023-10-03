Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
    resources :likes, only: [:create]
    resources :comments, only: [:create, :new]
  end
  end
end
