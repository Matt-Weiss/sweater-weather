require 'rails_helper'

RSpec.describe Favorite, type: :request do
  describe 'when a user submits a city' do
    it 'with a proper api key they delete that favorite' do

      user = User.create(email: "email@test.com",
                      password: "password")

      post "/api/v1/sessions", :params => {email: "email@test.com",
                                        password: "password"}

      location = Location.create(city_state: "denver,co",
                                    country: "United States",
                                   )
      location2 = Location.create(city_state: "pueblo,co",
                                    country: "United States")

      get "/api/v1/forecast?location=denver,co"
      get "/api/v1/forecast?location=pueblo,co"

      post "/api/v1/favorites", :params => {location: location.id,
                                        api_key: user.api_key}
      post "/api/v1/favorites", :params => {location: location2.id,
                                        api_key: user.api_key}

      delete "/api/v1/favorites", :params => { location: location.id,
                                                api_key: user.api_key}

      expect(response.status).to eq(200)
      expect(response.body).to_not include("denver,co")
    end

    it 'with a proper api key they see their favorites' do

      user = User.create(email: "email@test.com",
                      password: "password")

      post "/api/v1/sessions", :params => {email: "email@test.com",
                                        password: "password"}

      location = Location.create(city_state: "denver,co",
                                    country: "United States",
                                   )
      location2 = Location.create(city_state: "pueblo,co",
                                    country: "United States")

      get "/api/v1/forecast?location=denver,co"
      get "/api/v1/forecast?location=pueblo,co"

      post "/api/v1/favorites", :params => {location: location.id,
                                        api_key: user.api_key}
      post "/api/v1/favorites", :params => {location: location2.id,
                                        api_key: user.api_key}

      delete "/api/v1/favorites", :params => { location: location.id,
                                                api_key: 123}

      expect(response.status).to eq(401)
      expect(response.body).to include("Incorrect api_key")
    end
  end
end
