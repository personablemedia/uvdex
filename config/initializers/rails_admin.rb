RailsAdmin.config do |config|

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

	config.navigation_static_links = {
  	'Update Vehicles' => "/vehicles/update"
	}

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
