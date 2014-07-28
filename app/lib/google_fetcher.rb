module GoogleFetcher

	class SpreadSheet
		def initialize( file_key )
			session = GoogleDrive.login(GoogleFetcher::app_login, GoogleFetcher::app_password)
			@ws = session.spreadsheet_by_key( file_key ).worksheets[0]
		end

		def as_array
			@ws.rows
		end
	end

	class << self

		def session
			GoogleDrive.login(GoogleFetcher::app_login, GoogleFetcher::app_password)
		end

		def app_login
			Rails.env == "production" ? "tyrel@thetyrelcorporation.com" : "tyrel@thetyrelcorporation.com"
		end

		def app_password
			Rails.env == "production" ? "GA_BuddhA024878" : "GA_BuddhA024878"
		end

		def app_file_key
			Rails.env == "production" ? "12k78BnyWkGCo59-11g_WLCKskagR5Zc8-tT6WDhwuY8" : "12k78BnyWkGCo59-11g_WLCKskagR5Zc8-tT6WDhwuY8"
		end

		def car_array
			GoogleFetcher::SpreadSheet.new(GoogleFetcher::app_file_key).as_array
		end

	end

end
