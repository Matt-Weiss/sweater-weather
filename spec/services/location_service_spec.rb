require 'rails_helper'

describe LocationService do
  describe 'instance methods' do
    it 'get_json' do
      expected_response = {
        "results": [
            {
                "address_components": [
                    {
                        "long_name": "Denver",
                        "short_name": "Denver",
                        "types": [
                            "locality",
                            "political"
                        ]
                    },
                    {
                        "long_name": "Denver County",
                        "short_name": "Denver County",
                        "types": [
                            "administrative_area_level_2",
                            "political"
                        ]
                    },
                    {
                        "long_name": "Colorado",
                        "short_name": "CO",
                        "types": [
                            "administrative_area_level_1",
                            "political"
                        ]
                    },
                    {
                        "long_name": "United States",
                        "short_name": "US",
                        "types": [
                            "country",
                            "political"
                        ]
                    }
                ],
                "formatted_address": "Denver, CO, USA",
                "geometry": {
                    "bounds": {
                        "northeast": {
                            "lat": 39.91424689999999,
                            "lng": -104.6002959
                        },
                        "southwest": {
                            "lat": 39.614431,
                            "lng": -105.109927
                        }
                    },
                    "location": {
                        "lat": 39.7392358,
                        "lng": -104.990251
                    },
                    "location_type": "APPROXIMATE",
                    "viewport": {
                        "northeast": {
                            "lat": 39.91424689999999,
                            "lng": -104.6002959
                        },
                        "southwest": {
                            "lat": 39.614431,
                            "lng": -105.109927
                        }
                    }
                },
                "place_id": "ChIJzxcfI6qAa4cR1jaKJ_j0jhE",
                "types": [
                    "locality",
                    "political"
                ]
            }
        ],
        "status": "OK"
    }
      location = Location.create(city_state: 'denver,co')
      location_info = LocationService.new(location)
      expect(location_info.get_json).to eq(expected_response)
    end

    it 'parse_location' do
      location = Location.create(city_state: 'denver,co')
      location_info = LocationService.new(location).parse_location
      expect(location_info.city_state).to eq("denver,co")
      expect(location_info.country).to eq("United States")
      expect(location_info.latitude).to eq("39.7392358")
      expect(location_info.longitude).to eq("-104.990251")
    end
  end
end
