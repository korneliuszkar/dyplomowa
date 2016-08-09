class UserMailer < ApplicationMailer
  def service_update(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
