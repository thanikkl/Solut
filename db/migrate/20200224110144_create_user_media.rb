class CreateUserMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :user_media do |t|
      t.string :title
      t.string :music_genre
      t.string :medium_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
