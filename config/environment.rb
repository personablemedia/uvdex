# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
UvdV1::Application.initialize!

ActionMailer::Base.smtp_settings = { 
  :user_name => 'heathrostmoters',
  :password => 'SG_BuddhA024878',
  :domain => 'SG_BuddhA024878',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
