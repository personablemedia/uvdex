UvdV1.Router.map ()->
	@resource('vehicles')
	@resource('vehicle', {path: "/vehicle/:vehicle_id"})
	@route('gallery',
		path: "/vehicle/:vehicle_id/gallery"
	)

UvdV1.IndexRoute = Ember.Route.extend(
	beforeModel: ->
		@transitionTo('vehicles')
)

UvdV1.VehiclesRoute = Ember.Route.extend(
	model: ->
		@store.find('vehicle')
)

UvdV1.VehicleRoute = Ember.Route.extend(
	model: (params) ->
		@store.find('vehicle', params.vehicle_id)
)
UvdV1.GalleryRoute = Ember.Route.extend(
	model: (params) ->
		@store.find('vehicle', params.vehicle_id)
)
