class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :stock
      t.string :new_used
      t.string :year
      t.string :sold
      t.string :model
      t.string :features
      t.string :color
      t.string :vin
      t.string :scheduled
      t.float :price
      t.float :msrp
      t.string :condition
      t.integer :passengers
      t.text :copy
      t.string :website
      t.string :make
      t.string :pkg
      t.integer :miles
      t.string :code
      t.string :previous_owner

      t.timestamps
    end
  end
end
