class ChangeDataTypeInBackgroundColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :locations, :background_url, :json, using: 'background_url::json'
  end
end
