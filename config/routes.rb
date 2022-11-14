Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  # resources :job_applications, only: [:index, :show, as: :job_application_show] do 
  #   resources :comments, only: [:create]
  # end 

  #admin
  namespace :admin do
    resources :jobs, except: [:index, :show] do
      resources :job_applications, only: [:index, :show, :edit, :update]
    end
  end

  #user 
  resources :jobs, only: [:index, :show] do
    resources :job_applications, only: [:create]
  end 
  resources :job_applications, only: [:index, :show]
end
