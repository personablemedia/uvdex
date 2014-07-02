module UvdParser
	class << self
		def update_vehicles
			new_vehicles = GoogleFetcher::new_car_array
			used_vehicles = GoogleFetcher::used_car_array
			new_parser = UvdParser.new(new_vehicles)
			used_parser = UvdParser.new(used_vehicles)

			new_parser.write_vehicles_to_database( false )
			used_parser.write_vehicles_to_database( true )
			#Used to set published
			Vehicle.all.each do |v|
				v.save
			end
		end
	end

	class UvdParser
		attr_reader :vechicle_attributes
		def initialize( vehicle_array )
			@vehicle_array = vehicle_array.dup
			obtain_vehicle_attributes_from_array
		end

		def write_vehicles_to_database( is_used )
			puts "Begining write of vehicle meta data"
			current_vehicles = []
			@vehicle_attributes.each do |vehicle_attrs|
				puts "Now working on a vehicle"
				vehicle = Vehicle.where( stock: vehicle_attrs["stock"] ).first_or_create
				vehicle_attrs.each do |key, value|
					vehicle.send("#{key}=", mapped_value(key, value)) if vehicle.respond_to? key
				end
				vehicle.save
				puts "Saved vehicle #{vehicle.id}"
				current_vehicles << vehicle
			end
			current_ids = current_vehicles.inject([]){|r,v| r << v.id}
			
			Vehicle.where(is_used: is_used).where.not(id: current_ids).destroy_all
			puts "removing old vehicles"
			build_vehicle_photos
		end

		def mapped_value(key, value)
			case key
				when "price", "msrp"
					value.gsub("$","").gsub(",","").to_f
				else
					value
			end
		end

		private
		def obtain_vehicle_attributes_from_array
			@vehicle_attributes = []
			obtain_keys_from_and_drop_first_row
			remove_extra_header_rows
			remove_empy_rows
			@vehicle_array.each do |row|
				col_attributes = {}
				row.each_with_index do |col, i|
					col_attributes[@keys[i]] = col
				end
				@vehicle_attributes.push col_attributes
			end
		end

		def obtain_keys_from_and_drop_first_row
			@header_row = @vehicle_array.shift
			@keys = @header_row.dup
			@keys.map!{ |k| k.parameterize.gsub("-","_") }
		end

		def remove_extra_header_rows
			@vehicle_array.select!{ |row| row != @header_row }
		end

		def remove_empy_rows
			@vehicle_array.select! do |row|
				row_has_data = false
				row.each do |col|
					row_has_data = true if col.present?
				end
				row_has_data
			end
		end
		def build_vehicle_photos
			puts "Executing build photos"
			session = GoogleFetcher::session
			root_folder_name = (Rails.env == "production") ? "UVD" : "UVD"
			images_folder_name =  (Rails.env == "production") ? "Vehicle Pictures" : "Vehicle Pictures"
			root_folder = session.collection_by_title(root_folder_name)
			images_folder = root_folder.subcollection_by_title(images_folder_name)
			images_folder.files.each do |vechicle_image_folder|
				puts "Now in #{vechicle_image_folder.title}"
				vehicle_stock_code = vechicle_image_folder.title.split(" - ").first.strip
				is_default = vechicle_image_folder.title.split(" - ").last.strip =~ /d/i ? true : false
				puts is_default ? "Image is default" : "Image is not default"
				vehicle = Vehicle.find_by( stock: vehicle_stock_code )
				if vehicle
					puts "Now in vehicle #{vehicle.id}"
					old_photo_names = vehicle.vehicle_photos.all.inject([]){|r,v| r << v.google_drive_file_name}
					new_photo_names = []
					vechicle_image_folder.files.each do |photo|
						new_photo_names << photo.title
						unless old_photo_names.include?(photo.title) or not photo.title.split(".").last =~ /(gif|png|jpg|tif)/i
							begin
								puts "Atempting Save #{photo.title}"
								p = VehiclePhoto.new
								p.vehicle_id = vehicle.id
								p.google_drive_file_name = photo.title
								p.photo = StringIO.new(photo.download_to_string)
								p.save
								puts p.errors.messages unless p.valid?
								sleep 0.01
								puts "Save success"
							rescue => e
								puts "Save Fail"
								puts e
							end
						end
					end
					vehicle.vehicle_photos.each do |photo|
						unless new_photo_names.include?(photo.google_drive_file_name)
							photo.destroy
							puts "Destroying redundent photo"
						end
					end
					vehicle.save
				else
					puts "Vehicle not fount"
				end
			end
		end
	end
end
