class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :define_user

  def define_user
    @user = current_user
  end
end
