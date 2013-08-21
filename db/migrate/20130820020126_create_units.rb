class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :type
      t.string :location
      t.float :delay
      t.integer :user_id

      t.timestamps
    end
		add_index :units, [:user_id, :created_at]
  end
end
