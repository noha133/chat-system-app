Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  post '/applications/create/', to: 'apps#create'
  get '/applications/list/', to: 'apps#index'
  get '/applications/:token', to: 'apps#show'
  patch '/applications/:token', to: 'apps#update'

  post '/applications/:token/chats', to: 'chats#create'
  get '/applications/:token/chats', to: 'chats#index'

  post '/applications/:token/chats/:chat_number/messages', to: 'messages#create'
  get '/applications/:token/chats/:chat_number/messages', to: 'messages#index'

  get '/applications/:token/chats/:chat_number/messages/search/:q', to: 'search#search_message'




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
