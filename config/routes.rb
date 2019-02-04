Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users

     get 'user', to: 'users#show', as: 'user_show'
     post 'login', to: 'users#login', as: 'user_login'

      resources :trails
      resources :user_trails
    end
  end
end
