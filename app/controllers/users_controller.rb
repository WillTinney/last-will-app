class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_user_id, only: [:profile, :call_to_action, :digital, :proof, :notes, :admin, :photos, :videos]

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def profile
    authorize @user
  end

  def call_to_action
    authorize @user
  end

  def digital
    authorize @user
  end

  def proof
    authorize @user
  end

  def notes
    authorize @user
  end

  def references
    authorize @user
  end

  def photos
    authorize @user
  end

  def video
    authorize @user
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
