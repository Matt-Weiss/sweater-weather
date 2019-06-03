require 'rails_helper'

describe 'Flickr API' do
  it 'can retrieve background images' do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
  end
end
