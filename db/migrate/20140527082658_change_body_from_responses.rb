class ChangeBodyFromResponses < ActiveRecord::Migration
  def change
	change_column :responses, :body, :text
  end
end
