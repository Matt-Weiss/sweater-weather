require 'rails_helper'

RSpec.describe Favorite, type: :request do
  describe 'when a user submits a city' do
    it 'with a proper api key they add a favorite' do

      user = User.create(email: "email@test.com",
                      password: "password")

      post "/api/v1/favorites", :params => {location: "denver,co",
                                        api_key: user.api_key}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
    end

    it 'with a bad api key they get a 401' do

      user = User.create(email: "email@test.com",
                      password: "password")

      post "/api/v1/favorites", :params => {location: "denver,co",
                                        api_key: user.api_key}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(401)
    end
  end
end
