class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  protected

  # Redirect to personal details page
  def after_sign_up_path_for(resource)
    after_sign_up_path(:sign_up)
  end
end
