UvdV1.VehiclePhoto = DS.Model.extend(
	vehicle: DS.belongsTo('vehicle')
	large_url: DS.attr('string')
	thumb_url: DS.attr('string')
)
