UvdV1.VehiclesController = Ember.ArrayController.extend(
	conditionToFilterFor: "BOTH"
	dollarMax: 60000
	numberOfPassengers: "ALL"
	typeOfVehicle: null

	filteredContent: (->
		model = @get('model')
		condition = @get('conditionToFilterFor')
		max_price = @get('dollarMax')
		num_of_passengers = @get('numberOfPassengers')
		type_of_vehicle = @get('typeOfVehicle')

		model = model.filter((vehicle) ->
			keep = true
			if condition == "USED"
				keep = false unless vehicle.get('is_used') == true
			else if condition == "NEW"
				keep = false unless vehicle.get('is_used') == false

			unless max_price == 60000
				keep = false unless parseFloat(vehicle.get('price')) <= max_price

			unless type_of_vehicle == null
				keep = false unless vehicle.get('car_truck') == type_of_vehicle

			unless num_of_passengers == "ALL"
				keep = false unless vehicle.get('passengers') >= num_of_passengers
			keep
		)
	).property('conditionToFilterFor', 'dollarMax', 'typeOfVehicle', 'model.isLoaded')
)

GalleryController = Ember.ObjectController.extend(
	didInsertElement: ->
		$(".royalSlider").royalSlider(
			autoScaleSlider: true,
			thumbs:
				spacing: 10,
				arrowsAutoHide: true
		)
)
