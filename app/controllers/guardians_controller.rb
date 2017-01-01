class GuardiansController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
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
