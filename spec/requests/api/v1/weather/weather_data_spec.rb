require 'rails_helper'

describe 'weather API' do
  it 'sends weather for a location' do

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    #test that location is now in db by hitting endpoint again
    #the second hit should establish coverage on this path in controller
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
  end
end
