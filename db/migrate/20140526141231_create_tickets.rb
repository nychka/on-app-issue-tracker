class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :sender_name
      t.string :sender_email
      t.string :subject
      t.text :body
      t.string :code
      t.integer :department_id
      t.integer :owner_id
      t.integer :status_id

      t.timestamps
    end
  end
end
