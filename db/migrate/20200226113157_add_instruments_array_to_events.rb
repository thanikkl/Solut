class AddInstrumentsArrayToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :instruments_array, :string, array: true, default: []
  end
end
