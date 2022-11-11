Rails.application.routes.draw do
  # get 'comments/create'
  # get 'applications/index'
  # get 'applications/show'
  get 'jobs/index'
  get 'jobs/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  # resources :job_applications, only: [:index, :show, as: :job_application_show] do 
  #   resources :comments, only: [:create]
  # end 
  get 'job_applications/index'
  get 'job_applications/show'
end
