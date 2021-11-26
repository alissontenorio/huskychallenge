class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    @url  = auth_url(@user.activation_token)
    mail(to: @user.email, subject: 'Welcome to Husky Challenge')
  end
end
