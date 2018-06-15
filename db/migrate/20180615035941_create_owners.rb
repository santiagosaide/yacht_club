class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.integer :vessels_id
      t.integer :member_id

      t.timestamps

    end
  end
end
