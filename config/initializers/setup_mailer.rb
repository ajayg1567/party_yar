ActionMailer::Base.smtp_settings = { 
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "gmail.com",
  :authentication => :plain,
  :user_name => ENV['SMTP_EMAIL'],
  :password => ENV['SMTP_PASSWORD'],
  :openssl_verify_mode  => 'none'
}