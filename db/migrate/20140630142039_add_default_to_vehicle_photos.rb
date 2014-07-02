class AddDefaultToVehiclePhotos < ActiveRecord::Migration
  def change
    add_column :vehicle_photos, :default, :boolean
  end
end
