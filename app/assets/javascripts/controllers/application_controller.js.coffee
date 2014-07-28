UvdV1.ApplicationController = Ember.Controller.extend(
	needs: ["vehicles"]

	maxPrice: 60000

	maxPriceDollarString: ( ->
		currentPrice = parseFloat(@get('maxPrice'))
		if currentPrice == 60000
			"All Prices"
		else
			"$#{currentPrice.toFixed(2).toLocaleString()}"
	).property('maxPrice')

	actions:
		setConditionFilter: (condition) ->
			@get('controllers.vehicles').set('conditionToFilterFor', condition)
		setCarTypeFilter: (v_type) ->
			@get('controllers.vehicles').set('typeOfVehicle', v_type)

	maxPriceChanged: (->
		@get('controllers.vehicles').set('dollarMax', @get('maxPrice'))
	).observes('maxPrice')

)
