require 'pry'
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :subscribe ]

  def home
  end

  def subscribe

    subscribe_user_to_mailchimp
    respond_to do |format|
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
