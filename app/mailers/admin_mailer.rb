class AdminMailer < ActionMailer::Base
  default from: 'info@rostmoters.com'
 
  def import_fail_email( e )
		@e = e
		email = ( Rails.env == "production" ) ? "heath@personablemedia.com" : "tyrel@thetyrelcorporation.com"
    mail( to: email, subject: 'Rost Moter Google Doc Import Error' )
  end
end
