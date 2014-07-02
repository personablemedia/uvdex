class VehiclePhoto < ActiveRecord::Base
	belongs_to :vehicle
	has_attached_file :photo, :styles => { :medium => "300x300#", :thumb => "100x100#" }
	do_not_validate_attachment_file_type :photo
end
