class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.bigint :ticket_id, null: false
      t.text :text, null: false
      t.bigint :author_id
      t.string :new_status_id
      t.bigint :new_owner_id

      t.timestamps
    end

    add_foreign_key :messages, :tickets
    add_foreign_key :messages, :managers, column: :author_id
    add_foreign_key :messages, :managers, column: :new_owner_id
    add_foreign_key :messages, :statuses, column: :new_status_id
  end
end
