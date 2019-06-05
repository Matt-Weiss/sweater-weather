require 'rails_helper'

RSpec.describe User, type: :request do
  describe 'when a user submits their info' do
    it 'with a proper email they see their key' do

      post "/api/v1/users", :params => {email: "email@test.com",
                                        password: "password"}

      expect(response.status).to eq(201)
      expect(response.body.include?("api_key")).to eq(true)
    end

    it 'with a bad email they get an error' do

      user = User.create(email: "email@test.com",
                      password: "password")

      post "/api/v1/users", :params => {email: "email@test.com",
                                        password: "password"}

      expect(response.status).to eq(401)
    end
  end
end
