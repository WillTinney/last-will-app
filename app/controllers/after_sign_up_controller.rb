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
    @user.update_attributes(params[:user])
    render_wizard @user
  end
end
