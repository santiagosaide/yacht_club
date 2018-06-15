class CreateDockingSpaces < ActiveRecord::Migration
  def change
    create_table :docking_spaces do |t|
      t.integer :vessell_id

      t.timestamps

    end
  end
end
