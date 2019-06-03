class CreateLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city_state
      t.string :country
      t.string :latitude
      t.string :longitude
      t.json :forecast
    end
  end
end
