env :PATH, ENV['PATH']
set :environment, :production
set :output, 'log/whenever.log'

every 1.hours do
  rake "vehicles:fetch"
end
