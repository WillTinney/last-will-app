class AfterSignUpController < ApplicationController
  include Wicked::Wizard

  steps :sign_up, :basic_profile, :advanced_profile

  def show
    @user = current_user
    sign_in(@user, bypass: true)
    render_wizard
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    render_wizard @user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name,
      :address_line_1, :address_line_2, :town, :country, :postcode,
      :latitude, :longitude, :profile_picture)
  end
end
