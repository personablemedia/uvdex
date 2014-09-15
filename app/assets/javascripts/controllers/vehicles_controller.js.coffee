UvdV1.VehiclesController = Ember.ArrayController.extend(
	conditionToFilterFor: "BOTH"
	dollarMax: 60000
	numberOfPassengers: "ALL"
	typeOfVehicle: null
	sortProperties: ['year', 'price']
	sortAscending: false

	filteredContent: (->
		model = @get('arrangedContent')
		condition = @get('conditionToFilterFor')
		max_price = @get('dollarMax')
		num_of_passengers = @get('numberOfPassengers')
		type_of_vehicle = @get('typeOfVehicle')
		filter_for_favorites = @get('filterForFavorites')

		model = model.filter((vehicle) ->
			keep = true
			if filter_for_favorites
				keep = vehicle.get('is_favorited')
			else
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
	).property('conditionToFilterFor', 'dollarMax', 'typeOfVehicle', 'model.isLoaded', 'filterForFavorites', '@each.is_favorited')

	initiateFavorites: (->
		model = @get('model')
		favorites = $.cookie('favorites')
		if favorites
			$.each( favorites.split(':'), (i,e) ->
				v = model.findBy('id', e)
				if v
					v.set('is_favorited', true)
			)

	).observes('model.isLoaded')
)

UvdV1.VehicleController = Ember.ObjectController.extend(
	mobileFavoritesText: (->
		if @get('is_favorited')
			"Remove From Favorites"
		else
			"Add To Favorites"
	).property('is_favorited')
	isNotFavorite: (->
		if @get('is_favorited')
			return false
		else
			return true
	).property('is_favorited')
	actions:
		toggleFavorite: ->
			v = @get('model')
			vehicle_id = v.get('id')
			old_cookie = $.cookie('favorites')
			old_cookie ||= ""
			old_cookie = old_cookie.split(':')
			if v.get('is_favorited')
				v.set('is_favorited', false)
				new_cookie = []
				$.each( old_cookie, (i,e) ->
					new_cookie.push(e) unless e == vehicle_id
				)
				$.cookie('favorites', new_cookie.join(':'))
			else
				v.set('is_favorited', true)
				old_cookie.push(vehicle_id)
				$.cookie('favorites', old_cookie.join(':'))
)

UvdV1.CarController = Ember.ObjectController.extend(
	toggleFavoritesImageUrl: (->
		if @get('is_favorited')
			"/favorite_on.png"
		else
			"/favorite_off.png"
	).property('is_favorited')
	mobileFavoritesText: (->
		if @get('is_favorited')
			"Remove From Favorites"
		else
			"Add To Favorites"
	).property('is_favorited')
	actions:
		toggleFavorite: ->
			v = @get('model')
			vehicle_id = v.get('id')
			old_cookie = $.cookie('favorites')
			old_cookie ||= ""
			old_cookie = old_cookie.split(':')
			if v.get('is_favorited')
				v.set('is_favorited', false)
				new_cookie = []
				$.each( old_cookie, (i,e) ->
					new_cookie.push(e) unless e == vehicle_id
				)
				$.cookie('favorites', new_cookie.join(':'))
			else
				v.set('is_favorited', true)
				old_cookie.push(vehicle_id)
				$.cookie('favorites', old_cookie.join(':'))
				
)


UvdV1.GalleryController = Ember.ObjectController.extend(
	didInsertElement: ->
		$(".royalSlider").royalSlider(
			autoScaleSlider: true,
			thumbs:
				spacing: 10,
				arrowsAutoHide: true
		)
)
