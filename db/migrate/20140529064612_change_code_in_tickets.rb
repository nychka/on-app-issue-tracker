class ChangeCodeInTickets < ActiveRecord::Migration
  def change
	change_column :tickets, :code, :text
  end
end
