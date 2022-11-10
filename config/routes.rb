Rails.application.routes.draw do
  # get 'comments/create'
  # get 'applications/index'
  # get 'applications/show'
  get 'jobs/index'
  get 'jobs/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :applications do 
    resources :comments, only: [:create]
  end 
end
