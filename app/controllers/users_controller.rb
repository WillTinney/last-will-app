class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_user_id, only: [:profile, :children, :unlock, :unlock_data]

  def show
    authorize @user
    # @proofs = policy_scope(Proof)
    # @proof = Proof.new
  end

  def edit
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(user_params)
      redirect_to user_profile_path(@user)
    else
      render :edit
    end
  end

  def profile
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

  def children
    authorize @user
  end

  def unlock
    authorize @user
  end

  def unlock_data
    authorize @user
    @recipients = params[:user][:recipients]
    User.send_unlock_email(@user, @recipients)
    # if email is sent successfully
    @user.data_unlocked = true
    @user.save
    redirect_to user_unlock_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_id
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:email, :title, :first_name, :middle_name, :last_name,
      :citizenship, :date_of_birth, :phone_number, :gender,
      :address_line_1, :address_line_2, :city, :country, :postcode,
      :latitude, :longitude, :profile_picture, :data_unlocked)
  end
end
