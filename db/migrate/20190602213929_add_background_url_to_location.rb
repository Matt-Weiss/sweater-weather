class AddBackgroundUrlToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :background_url, :string
  end
end
