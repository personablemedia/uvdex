namespace :vehicles do

  desc "Import Vehicles From Google Docs"
  task fetch: :environment do
		begin
			UvdParser::update_vehicles
		rescue => e
			AdminMailer::import_fail_email( e ).deliver!
		end
  end

end
