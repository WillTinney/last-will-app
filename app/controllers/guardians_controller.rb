class GuardiansController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update, :destroy]

  def index
    @guardians = Guardian.all
  end

  def new
    @guardian = Guardian.new
  end

  def create
    @guardian = current_user.guardians.build(guardian_params)
    if @guardian.save
      redirect_to user_path(current_user), notice: 'Guardian was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
   if @guardian.update(guardian_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @guardian.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_guardian
    @guardian = Guardian.find(params[:id])
  end

  def guardian_params
    params.require(:guardian).permit(:first_name, :middle_name, :last_name, :citizenship,
      :date_of_birth, :email, :phone_number, :address_line_1, :address_line_2,
      :town, :postcode, :relationship, :profile_picture)
  end
end
