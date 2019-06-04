Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'weather/forecast#show'
      get '/backgrounds', to: 'weather/background#show'
      get '/favorites', to: 'favorite#index'

      post '/users', to: 'user#create'
      post '/sessions', to: 'session#create'
      post '/favorites', to: 'favorite#create'

      delete '/favorites', to: 'favorite#delete'
    end
  end
end
