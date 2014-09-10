UvdV1.ApplicationController = Ember.Controller.extend(
	needs: ["vehicles"]

	maxPrice: 60000

	filterForFavorites: false

	favoritesFooterImage: "/favorite.png"


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
		toggleFilterForFavorites: ->
			oldVal = @get('filterForFavorites')
			if oldVal
				@set('filterForFavorites', false)
			else
				@set('filterForFavorites', true)
			@transitionTo('vehicles')
		footerBackButton: ( ->
			if @get('currentPath') == "vehicles"
				if @get('filterForFavorites')
					@set('filterForFavorites', false)
				else
					window.location.href = 'http://rostmotor.com/'
			else
				@transitionTo('vehicles')
		)

	maxPriceChanged: (->
		@get('controllers.vehicles').set('dollarMax', @get('maxPrice'))
	).observes('maxPrice')

	filterForFavoritesDidChange: (->
		@get('controllers.vehicles').set('filterForFavorites', @get('filterForFavorites'))
		if @get('filterForFavorites')
			@set('favoritesFooterImage', "/favorite_engaged.png")
		else
			@set('favoritesFooterImage', "/favorite.png")
	).observes('filterForFavorites')

)
