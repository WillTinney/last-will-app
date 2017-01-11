class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def subscribe
    binding.pry
    gibbon = Gibbon::Request.new
    # gibbon.lists(list_id).members.create(body:
    #   {email_address: "foo@bar.com",
    #     status: "subscribed"})
  end

  private

  # def subscriber_params
  #   params.require(:).permit(:first_
  # end
end
