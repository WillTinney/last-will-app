class AssigneesController < ApplicationController
  before_action :set_assignee, only: [:show, :edit, :update, :destroy]
  before_action :set_assignee_id, only: [:notes, :admin, :photos, :videos]
  before_action :set_type

  def index
    @assignees = Assignee.all
  end

  def show
    @user = User.where('id = ?', params[:user_id]).first
  end

  def new
    @assignee = Assignee.new
  end

  def create
    @assignee = current_user.assignees.build(assignee_params)
    if @assignee.save
      respond_to do |format|
        format.js
        format.html { redirect_to user_path(current_user), notice: 'Assignee was successfully created.' }
      end
    else
      respond_to do |format|
        format.js
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
   if @assignee.update(assignee_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @assignee.destroy
    redirect_to user_path(current_user)
  end

  def notes
    @note = Note.new
  end

  def admin
  end

  def photos
  end

  def videos
  end

  private

  def set_assignee
    @assignee = Assignee.find(params[:id])
  end

  def set_assignee_id
    @assignee = Assignee.find(params[:assignee_id] || params[:approver_id] || params[:guardian_id] || params[:recipient_id])
  end

  def set_type
    if params[:type]
      @type = params[:type]
    elsif params[:format]
      @type = params[:format]
    end
  end

  def type
    params[:type]
  end

  def assignee_params
    params.require(type.downcase.to_sym || :assignee).permit(:first_name, :middle_name, :last_name, :citizenship,
      :date_of_birth, :email, :phone_number, :address_line_1, :address_line_2,
      :town, :country, :postcode, :relationship, :profile_picture, :type)
  end
end
