class AddSupportingToUnits < ActiveRecord::Migration
  def up
	  add_column :units, :supporting, :string
  end
  
  def down
	  remove_column :units, :supporting
  end
end
