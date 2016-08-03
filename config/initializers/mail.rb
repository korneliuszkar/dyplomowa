ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    #:authentication: "plain",
    #:enable_starttls_auto: true,
    :user_name => ENV['MANDRILL_USERNAME'],
    :password  => ENV['MANDRILL_API_KEY'],
    #:domain    => 'localhost'
  }
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = ENV['MANDRILL_API_KEY']
  config.deliver_later_queue_name = :default
end