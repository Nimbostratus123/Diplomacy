class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.string :nation
      t.string :location

      t.timestamps
    end
  end
end
