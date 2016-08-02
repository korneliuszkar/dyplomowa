unless Rails.env.production?
  class OverrideMailRecipient
    def self.delivering_email(mail)
      mail.subject = "[#{Rails.env.to_s}]" + mail.to.to_s + " " + mail.subject
      mail.to = ENV["EMAIL_COMMUNICATION_DEV_ADDRESS"].split(",")
      mail.cc = []
      mail.bcc = []
    end
  end
  ActionMailer::Base.register_interceptor(OverrideMailRecipient)
end