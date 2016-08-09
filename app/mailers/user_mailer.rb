class UserMailer < ApplicationMailer
  def service_update(user)
    @user = User.find(21)
    @url  = 'dyplomowa.dev'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
