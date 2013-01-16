class RemovePasswordFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :password 
  	add_column :users, :password_digest, :string
  end

  def down
  	add_column :users, :password, :string
  	remove_column :users, :password_digest
  end
end
