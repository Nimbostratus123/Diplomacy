class AddArchivedToMessages < ActiveRecord::Migration
	def up
		  add_column :messages, :archived, :boolean
	end
	
	def down
		  remove_column :messages, :archived
	end
  
end
