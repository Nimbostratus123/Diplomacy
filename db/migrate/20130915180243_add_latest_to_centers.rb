class AddLatestToCenters < ActiveRecord::Migration
  def up
	  add_column :centers, :latest, :string
  end
  
  def down
	  remove_column :centers, :latest
  end
end
