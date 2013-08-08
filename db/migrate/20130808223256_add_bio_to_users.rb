class AddBioToUsers < ActiveRecord::Migration
  def up
		add_column :users, :bio, :string
  end
	
	def down
		remove_column :users, :bio
	end
end
