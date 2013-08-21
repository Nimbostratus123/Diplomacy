class AddDestinationToUnits < ActiveRecord::Migration
  def up
		add_column :units, :destination, :string
  end
	
	def down
		remove_column :units, destination
	end
	
end
