ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => '587',
  :domain => "kadencer.com",
  :authentication => :plain,
  :user_name => "no-reply@kadencer.com",
  :password => "kadencer8437"
}