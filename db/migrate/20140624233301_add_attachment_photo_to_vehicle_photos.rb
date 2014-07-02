class AddAttachmentPhotoToVehiclePhotos < ActiveRecord::Migration
  def self.up
    change_table :vehicle_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :vehicle_photos, :photo
  end
end
