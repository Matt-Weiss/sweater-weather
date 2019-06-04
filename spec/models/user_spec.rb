require 'rails_helper'

RSpec.describe User, type: :request do

  it 'can create a user and return an api key' do

    post "/api/v1/users", :params => {email: "email@test.com",
                                   password: "password"}

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(json[:api_key]).to_not eq(nil)
  end

  it 'a user can log in. their api key is returned and session is created' do

    user = User.create(email: "email@test.com",
                    password: "password")

    post "/api/v1/sessions", :params => {email: "email@test.com",
                                      password: "password"}

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(json[:api_key]).to_not eq(nil)
  end
end

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:locations)}
  end
end
