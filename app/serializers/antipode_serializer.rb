class AntipodeSerializer
  include FastJsonapi::ObjectSerializer

  attribute :location_name do |object|
    object.city_state
  end

  attribute :forecast do |object|
    object.forecast = {summary: object.forecast["currently"]["summary"],
           current_temperature: object.forecast["currently"]["temperature"]
                      }
  end

  attribute :search_location do |object, params|
    params[:original_location].formatted_address
  end
end
