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

		def app_new_file_key
			Rails.env == "production" ? "1dczU6UbCdCQkF0Rq1-IuTESxexq7XaTIyFMLOWsHmPM" : "1EDQgl4_3N-3LvjP2U0YH1M0LdkiXYcb1xVWe0cKGPAI"
		end

		def app_used_file_key
			Rails.env == "production" ? "1EX5mZ0N1lGYV41v9XMwApfQ2-0A83IgEUHo-iTg9Wxw" : "1DqP7rCBw6DgK-V2Iv9V0t6Rh8yZJrL2Bs5et4v_coQ8"
		end

		def new_car_array
			GoogleFetcher::SpreadSheet.new(GoogleFetcher::app_new_file_key).as_array
		end

		def used_car_array
			GoogleFetcher::SpreadSheet.new(GoogleFetcher::app_used_file_key).as_array
		end

	end

end
