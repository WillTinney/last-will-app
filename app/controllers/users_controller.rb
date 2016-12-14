class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name,
      :address_line_1, :address_line_2, :town, :country, :postcode,
      :latitude, :longitude, :profile_picture)
  end
end
