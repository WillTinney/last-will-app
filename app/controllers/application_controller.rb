class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource_or_scope)
    current_user
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
end
