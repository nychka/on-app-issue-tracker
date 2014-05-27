class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :body
      t.integer :sender

      t.timestamps
    end
  end
end
