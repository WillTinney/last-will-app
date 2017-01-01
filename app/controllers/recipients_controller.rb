class RecipientsController < ApplicationController
  before_action :set_recipient, only: [:show, :edit, :update, :destroy]

  def index
    @recipients = Recipient.all
  end

  def show
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = current_user.recipients.build(recipient_params)
    if @recipient.save
      redirect_to user_path(current_user), notice: 'Data was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
   if @recipient.update(recipient_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @recipient.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_recipient
    @recipient = Recipient.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(:first_name, :middle_name, :last_name, :citizenship,
      :date_of_birth, :email, :phone_number, :address_line_1, :address_line_2,
      :town, :postcode, :relationship, :profile_picture)
  end
end
