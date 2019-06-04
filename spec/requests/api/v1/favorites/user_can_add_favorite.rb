require 'rails_helper'

RSpec.describe Favorite, type: :request do
  describe 'when a user submits a city' do
    it 'with a proper api key they add a favorite' do

      user = User.create(email: "email@test.com",
                      password: "password")

      post "/api/v1/sessions", :params => {email: "email@test.com",
                                        password: "password"}

      location = Location.create(city_state: "denver,co",
                                    country: "United States")

      post "/api/v1/favorites", :params => {location: location.id,
                                        api_key: user.api_key}

      json = JSON.parse(response.body, symbolize_names: true)
      favorite = Favorite.last
      expect(favorite.user_id).to eq(user.id)
      expect(favorite.location_id).to eq(location.id)
      expect(response.status).to eq(201)
    end

    it 'with a bad api key get a 401 error' do

      user = User.create(email: "email@test.com",
                      password: "password")

      post "/api/v1/sessions", :params => {email: "email@test.com",
                                        password: "password"}

      location = Location.create(city_state: "denver,co",
                                    country: "United States")

      post "/api/v1/favorites", :params => {location: location.id,
                                        api_key: "123"}

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
    end


  end
end
