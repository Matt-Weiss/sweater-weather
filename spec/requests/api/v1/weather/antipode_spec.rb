require 'rails_helper'


describe 'Amypode API' do
  it 'retrieves antipode coordinates for a given city' do


    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful
    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(json_response[:data][:attributes][:search_location]).to eq("Hong Kong")
    expect(json_response[:data][:attributes][:location_name]).to eq("Yavi Department")
  end
end
