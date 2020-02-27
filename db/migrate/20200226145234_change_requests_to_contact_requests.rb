class ChangeRequestsToContactRequests < ActiveRecord::Migration[6.0]
  def change
    rename_table :requests, :contact_requests
  end
end
