require 'rails_helper'

describe 'Antipode Service' do
  it 'can retrieve antipode coordinates' do
    expected_return = {:data=>
                        {:id=>"1",
                       :type=>"antipode",
                 :attributes=>
                         {:lat=>-22.3193039,
                         :long=>-65.8306389}}}

    location = Location.create(city_state: "hongkong",
                                  country: "Hong Kong",
                                 latitude: "22.3193039",
                                longitude: "114.1693611")
    antipode = AntipodeService.new(location)
    expect(antipode.find_antipode).to eq(expected_return)
  end
end
