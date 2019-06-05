require 'rails_helper'

RSpec.describe User, type: :request do
  describe 'when a user submits their info' do
    it 'with a proper login they see their key' do

      user = User.create(email: "email@test.com",
                      password: "password")

      post "/api/v1/sessions", :params => {email: "email@test.com",
                                        password: "password"}

      expect(response.status).to eq(200)
      expect(user.api_key).to_not eq(nil)
    end

    it 'with a bad login they get an error' do

      user = User.create(email: "email@test.com",
                      password: "password")

      post "/api/v1/sessions", :params => {email: "email@test.com",
                                        password: "wordpass"}

      expect(response.status).to eq(401)
    end
  end
end
