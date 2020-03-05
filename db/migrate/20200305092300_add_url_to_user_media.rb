class AddUrlToUserMedia < ActiveRecord::Migration[6.0]
  def change
    add_column :user_media, :url, :string
  end
end
