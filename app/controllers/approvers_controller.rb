class ApproversController < ApplicationController
  before_action :set_approver, only: [:show, :edit, :update, :destroy]

  def index
    @approvers = Approver.all
  end

  def show
  end

  def new
    @approver = Approver.new
  end

  def create
    @approver = current_user.approvers.build(approver_params)
    if @approver.save
      redirect_to user_path(current_user), notice: 'Approver was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
   if @approver.update(approver_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @approver.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_approver
    @approver = Approver.find(params[:id])
  end

  def approver_params
    params.require(:approver).permit(:first_name, :middle_name, :last_name, :citizenship,
      :date_of_birth, :email, :phone_number, :address_line_1, :address_line_2,
      :town, :country, :postcode, :relationship, :profile_picture)
  end
end
