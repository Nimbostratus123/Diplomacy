class AddPasswordToUsers < ActiveRecord::Migration
  
	def up
	  add_column :users, :encrypted_password, :string
	end
	
	def change
    add_column :users, :encrypted_password, :string
  end
	
	def up
		remove_column :users, :encrypted_password
	end
	
end
