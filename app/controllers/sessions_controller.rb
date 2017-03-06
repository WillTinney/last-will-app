class SessionsController < Devise::SessionsController

  # Devise standard controller methods
  # def new
  #   self.resource = resource_class.new(sign_in_params)
  #   clean_up_passwords(resource)
  #   yield resource if block_given?
  #   respond_with(resource, serialize_options(resource))
  # end

  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message!(:notice, :signed_in)
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   respond_with resource, location: after_sign_in_path_for(resource)
  # end

  # Working AJAX login except errors
  # def create
  #   resource = warden.authenticate!(:scope => resource_name, :recall => "home#index")
  #   sign_in_without_redirect(resource_name, resource)
  #   @after_sign_in_path = after_sign_in_path_for(resource)
  # end

  # def sign_in_without_redirect(resource_or_scope, resource=nil)
  #   scope = Devise::Mapping.find_scope!(resource_or_scope)
  #   resource ||= resource_or_scope
  #   sign_in(scope, resource) unless warden.user(scope) == resource
  # end

  protected

  def after_sign_in_path_for(resource)
    user_profile_path(current_user)
  end

end
