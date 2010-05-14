class UserMailer < ActionMailer::Base
  
  include ActionController::UrlWriter
  
  MAIL_SETUP = {
    :from =>'kaado_dipl@gmx.de',
  }

  def confirmation_code(user)
    from 	      MAIL_SETUP[:from]
    recipients  user.email
    subject     'Please confirm your registration'
    body	      :user => user 
    sent_on     Time.now	
  end  
  
  def password_reset_instructions(user)  
    from        MAIL_SETUP[:from]
    recipients  user.email
    subject     'How to reset your password'
    body	      :user => user 
    sent_on     Time.now	
  end  

end