UvdV1.Vehicle = DS.Model.extend(
	stock: DS.attr('string')
	new_used: DS.attr('string')
	year: DS.attr('number')
	sold: DS.attr('string')
	model: DS.attr('string')
	features: DS.attr('string')
	color: DS.attr('string')
	vin: DS.attr('string')
	scheduled: DS.attr('string')
	price: DS.attr('number')
	msrp: DS.attr('string')
	condition: DS.attr('string')
	passengers: DS.attr('number')
	copy: DS.attr('string')
	website: DS.attr('string')
	make: DS.attr('string')
	pkg: DS.attr('string')
	miles: DS.attr('string')
	code: DS.attr('string')
	previous_owner: DS.attr('string')
	created_at: DS.attr('string')
	updated_at: DS.attr('string')
	is_used: DS.attr('boolean')
	top_photo_url: DS.attr('string')
	published: DS.attr('string')
	vehicle_photos: DS.hasMany('vehicle_photo')
	car_truck: DS.attr('string')
	is_favorited: DS.attr('boolean')

	featuresArray: (->
		@get('features')
	).property('features')

	copy_exerpt: (->
		$.truncate(@get('copy'),
			length: 50
		)
	).property('copy')

	makeModel: (->
		"#{@get('year')} #{@get('make')} #{@get('model')}"
	).property('make', 'model', 'year')

	msrpAsDollar: (->
		if @get('msrp') > 0
			"Their Price: $#{UvdLib.numberWithCommas(parseFloat(@get('msrp')).toFixed(2).toLocaleString())}"
		else
			"Unknown"
	).property('mrsp')

	priceAsDollar: (->
		if @get('price') > 0
			"Our Price: $#{UvdLib.numberWithCommas(parseFloat(@get('price')).toFixed(2).toLocaleString())}"
		else
			"Our Price: Call for details"
	).property('price')

	priceAsDollarSikpPrefix: (->
		if @get('price') > 0
			"$#{UvdLib.numberWithCommas(parseFloat(@get('price')).toFixed(2).toLocaleString())}"
		else
			"Call for Pricing"
	).property('price')

	new_used_class: (->
		@get('is_used') ? "used" : "new"
	).property('is_used')

	mileage_string: ( ->
		"Mileage: #{@get('miles')}"
	).property('miles')

	stock_number_string: ( ->
		"Stock #: #{@get('stock')}"
	).property('stock')

	new_used_string: (->
		if @get('is_used')
			"Condition: Used"
		else
			"Condition: New"
	).property('is_used')

	vin_string: ( ->
		"VIN#: #{@get('vin')}"
	).property('vin')

	color_string: ( ->
		"Color#: #{@get('color')}"
	).property('color')

	passenger_string: (->
		"Passengers: #{@get('passengers')}"
	).property('passengers')

	condition_string: (->
		if @get('is_used')
			"Used"
		else
			"New"
	).property('is_used')

)
