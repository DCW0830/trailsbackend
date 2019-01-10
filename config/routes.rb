Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :trails
      resources :users
      resources :user_trails
    end
  end
end
