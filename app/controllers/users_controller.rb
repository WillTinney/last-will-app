class UsersController < ApplicationController
  layout 'dashboard'

  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_user_id, only: [:profile, :call_to_action, :digital, :proof, :notes, :admin, :photos, :videos]

  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def profile
  end

  def call_to_action
  end

  def digital
  end

  def proof
  end

  def notes
  end

  def admin
  end

  def photos
  end

  def videos
    @video = Video.new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_id
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :middle_name, :last_name,
      :address_line_1, :address_line_2, :town, :country, :postcode,
      :latitude, :longitude, :profile_picture, :proof_of_residency,
      :proof_comments)
  end
end
