class AddSupportToUnits < ActiveRecord::Migration
  def up
	  add_column :units, :support, :integer
  end
  
  def down
	  remove_column :units, :support
  end
end
