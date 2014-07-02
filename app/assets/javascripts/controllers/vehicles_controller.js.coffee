UvdV1.VehiclesController = Ember.ArrayController.extend(
	conditionToFilterFor: "BOTH"
	dollarMax: 50000
	numberOfPassengers: "ALL"

	filteredContent: (->
		model = @get('model')
		condition = @get('conditionToFilterFor')
		max_price = @get('dollarMax')
		num_of_passengers = @get('numberOfPassengers')

		model = model.filter((vehicle) ->
			keep = true
			if condition == "USED"
				keep = false unless vehicle.get('is_used') == true
			else if condition == "NEW"
				keep = false unless vehicle.get('is_used') == false

			unless max_price == 50000
				keep = false unless vehicle.get('price') <= max_price

			unless num_of_passengers == "ALL"
				keep = false unless vehicle.get('passengers') == num_of_passengers
			keep
		)
	).property('conditionToFilterFor', 'dollarMax', 'numberOfPassengers', 'model.isLoaded')
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
