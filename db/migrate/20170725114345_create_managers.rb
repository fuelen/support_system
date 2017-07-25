class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.string :username, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
