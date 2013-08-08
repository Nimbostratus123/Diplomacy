class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :origin
      t.string :destination
      t.integer :user_id

      t.timestamps
    end
		add_index :moves, [:user_id, :created_at]
  end
end
