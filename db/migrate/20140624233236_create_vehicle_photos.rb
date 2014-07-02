class CreateVehiclePhotos < ActiveRecord::Migration
  def change
    create_table :vehicle_photos do |t|
      t.string :google_drive_file_name
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
