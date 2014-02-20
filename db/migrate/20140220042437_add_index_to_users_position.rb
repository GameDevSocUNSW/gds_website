class AddIndexToUsersPosition < ActiveRecord::Migration
  def change
     add_index :users, :position, unique: true
  end
end
