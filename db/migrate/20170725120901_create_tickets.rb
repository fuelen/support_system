class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :customer_name, null: false
      t.string :customer_email, null: false
      t.string :department, null: false
      t.string :subject, null: false
      t.text :body, null: false
      t.bigint :owner_id # rails 5 uses bigint as primary key by default, so...
      t.string :status_id, null: false
      t.string :reference, null: false

      t.timestamps
    end

    add_index :tickets, :reference, unique: true
    add_foreign_key :tickets, :statuses
    add_foreign_key :tickets, :managers, column: :owner_id
  end
end
