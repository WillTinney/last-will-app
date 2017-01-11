require 'pry'
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :subscribe ]

  def home
  end

  def subscribe
    respond_to do |format|
      begin
        subscribe_user_to_mailchimp
      rescue Gibbon::MailChimpError => e
        format.js { render :subscribe, locals: { error: e.body["detail"] }  }
      end
        format.js
end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end

  def subscribe_user_to_mailchimp
    gibbon = Gibbon::Request.new
    gibbon.lists(ENV['MAIL_CHIMP_LIST_ID']).members.create(body:
      {email_address: subscriber_params[:email],
      status: "subscribed"})
  end
end
