class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses, id: false do |t|
      t.string :id, primary_key: true
      t.string :name, null: false
      t.integer :kind, null: false

      t.timestamps
    end

    add_index :statuses, :name, unique: true
  end
end
