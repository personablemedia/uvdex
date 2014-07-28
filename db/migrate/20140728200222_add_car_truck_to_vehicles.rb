class AddCarTruckToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :car_truck, :string
  end
end
