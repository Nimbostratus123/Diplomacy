class AddNationToUsers < ActiveRecord::Migration
  def up
    add_column :users, :nation, :string
  end
	
	def down
		remove_column :users, :admin
	end
	
end
