Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new, :destroy] do
    resources :likes, only: [:create]
    resources :comments, only: [:create, :new, :destroy]
  end
  end
end
