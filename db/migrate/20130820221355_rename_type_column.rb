class RenameTypeColumn < ActiveRecord::Migration
  def change
		rename_column :units, :type, :kind
  end
end
