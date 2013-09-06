class AddLatestToUnits < ActiveRecord::Migration
  def up
	  add_column :units, :latest, :string
  end
  
  def down
	  remove_column :units, :latest
  end
end
