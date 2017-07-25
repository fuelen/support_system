class AddUniqIndexToManagersUsername < ActiveRecord::Migration[5.1]
  def change
    add_index :managers, :username, unique: true
  end
end
