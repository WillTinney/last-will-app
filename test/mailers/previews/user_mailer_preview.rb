class UserMailerPreview < ActionMailer::Preview
  # Go to localhost:3000/rails/mailers/user_mailer/unlock

  def unlock
    user = User.first
    UserMailer.unlock(user)
  end
end

