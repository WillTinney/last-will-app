class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  protected

  # Redirect to personal details page
  def after_sign_up_path_for(resource)
    user_after_sign_up_path(@user, :basic_profile)
  end
end
