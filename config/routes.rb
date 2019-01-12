Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users

     post 'signup', to: 'users#create', as: 'user_signup'
     post 'login', to: 'users#login', as: 'user_login'

      resources :trails
      resources :user_trails
    end
  end
end
