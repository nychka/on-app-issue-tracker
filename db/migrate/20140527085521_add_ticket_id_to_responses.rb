class AddTicketIdToResponses < ActiveRecord::Migration
  def change
	add_column :responses, :ticket_id, :integer, null: false, after: :body
	add_index :responses, :ticket_id
  end
end
