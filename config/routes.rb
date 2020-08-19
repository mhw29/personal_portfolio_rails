Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'interests/home'
  resources :projects
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  get 'blog', to: 'posts#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
end
