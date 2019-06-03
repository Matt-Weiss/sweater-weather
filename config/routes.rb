Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'weather/forecast#show'
      get '/backgrounds', to: 'weather/background#show'
    end
  end
end
