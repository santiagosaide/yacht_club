class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.string :name
      t.string :lenght
      t.string :brand
      t.string :construction_date
      t.string :model
      t.string :city
      t.string :country_of_origin
      t.string :propulsion

      t.timestamps

    end
  end
end
