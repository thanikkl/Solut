class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.string :location
      t.integer :capacity
      t.string :title
      t.string :event_type
      t.integer :duration
      t.string :genre
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
