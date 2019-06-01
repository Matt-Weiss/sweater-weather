require 'rails_helper'

describe 'weather API' do
  it 'sends weather for a location' do
    get '/api/v1/forecast'

    expect(response).to be_successful
  end
end
