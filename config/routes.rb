Rails.application.routes.draw do
  # get 'chats/index'
  # get 'chats/show'
  # get 'chats/create'
  # get 'chats/update'
  # get 'apps/index'
  # get 'apps/show'
  # get 'apps/create'
  # get 'apps/update'
  post '/applications', to: 'apps#create'
  get '/applications', to: 'apps#index'
  get '/applications/:token', to: 'apps#show'
  patch '/applications/:token', to: 'apps#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
