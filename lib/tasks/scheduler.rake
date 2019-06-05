desc "This task is called by the Heroku scheduler add-on"
task :update_cache => :environment do
  Location.all do |location|
    forecast = Rails.cache.fetch("location-#{location.id}-forecast", expires_in: 15.minutes) do
      get_weather(location)
    end
  end
end
