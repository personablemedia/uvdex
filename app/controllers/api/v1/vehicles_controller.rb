class Api::V1::VehiclesController < ApplicationController
	def index
		@vehicles = Vehicle.published
		@vehicles.map! do |v|
			hash = v.attributes
			hash[:vehicle_photo_ids] = v.vehicle_photos.inject([]){|r,v| r << v.id}
			default = v.vehicle_photos.where(default: true).first
			default ||= v.vehicle_photos.first
			hash[:top_photo_url] = default.photo.url(:medium)
			hash
		end
		@vehicle_photos = VehiclePhoto.all
		@vehicle_photos.map! do |p|
			hash = p.attributes
			hash[:large_url] = p.photo.url(:large)
			hash[:thumb_url] = p.photo.url(:medium)
			hash
		end
		render json: { "vehicles" => @vehicles, "vehicle_photos" => @vehicle_photos }.to_json
	end

	def show
		vehicle = Vehicle.find(params[:id])
		@vehicle = vehicle.attributes
		@vehicle[:vehicle_photo_ids] = vehicle.vehicle_photos.inject([]){|r,v| r << v.id}
		default = vehicle.vehicle_photos.where(default: true).first
		default ||= vehicle.vehicle_photos.first
		@vehicle[:top_photo_url] = default.photo.url(:medium)
		@vehicle_photos = VehiclePhoto.where(vehicle_id: @vehicle["id"])
		@vehicle_photos.map! do |p|
			hash = p.attributes
			hash[:large_url] = p.photo.url
			hash[:thumb_url] = p.photo.url(:thumb)
			hash
		end
		render json: { "vehicle" => @vehicle, "vehicle_photos" => @vehicle_photos }.to_json
	end
end
