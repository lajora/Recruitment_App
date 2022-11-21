Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
 
  resources :jobs do
    resources :job_applications, except: [:index, :show] 
    
  end
  
  resources :job_applications, only: [:index, :show] do 
    patch '/next_step', to:'job_applications#go_next_stage', on: :member
    patch '/previous_step', to:'job_applications#go_previous_stage', on: :member
    patch '/reject', to:'job_applications#reject', on: :member
    patch '/reject_offer', to:'job_applications#reject_offer', on: :member
    patch '/accept_offer', to:'job_applications#accept_offer', on: :member
    resources :comments
  end
  
end
