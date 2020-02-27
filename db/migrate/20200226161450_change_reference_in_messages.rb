class ChangeReferenceInMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :request_id
    add_reference :messages, :contact_request, foreign_key: true, index: true
  end
end
