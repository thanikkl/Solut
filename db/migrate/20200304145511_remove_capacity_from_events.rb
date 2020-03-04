class RemoveCapacityFromEvents < ActiveRecord::Migration[6.0]
  def change

    remove_column :events, :capacity, :integer
  end
end
