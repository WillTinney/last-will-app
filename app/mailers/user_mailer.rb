class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.unlock.subject
  #
  def unlock(user, recipients)
    @user = user

    @user.proofs.each do |proof|
      attachments[proof.title] = open("http://res.cloudinary.com/dv2qtdzv0/image/upload/" + proof.document.path).read
    end

    recipients << "unlock@brexithedge.co.uk" # public.enquiries@homeoffice.gsi.gov.uk

    mail to: recipients, subject: "BrexitHedge Data Unlock - " + @user.first_name + " " + @user.last_name
  end
end
