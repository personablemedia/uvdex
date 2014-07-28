class VehiclesController < ApplicationController
	before_action :authenticate_user!
	def update
		system("rake vehicles:fetch &")
		redirect_to "/admin", notice: "Vehicles are being updated they should be complete in about 10 minuets"
	end
end
