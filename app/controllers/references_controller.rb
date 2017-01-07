class ReferencesController < ApplicationController
   before_action :set_reference, only: [:edit, :update, :destroy]
   before_action :set_owner, only: [:new, :create, :edit, :update, :destroy]

  def index
    @references = Reference.all
  end

  def new
    @reference = Reference.new
  end

  def create
    if @approver
      @reference = current_user.approvers.find(@approver.id).references.build(reference_params)
      if @reference.save
        redirect_to user_path(current_user), notice: 'Reference was successfully created.'
      else
        render :new
      end
    elsif @guardian
      @reference = current_user.guardians.find(@guardian.id).references.build(reference_params)
      if @reference.save
        redirect_to user_path(current_user), notice: 'Reference was successfully created.'
      else
        render :new
      end
    elsif @recipient
      @reference = current_user.recipients.find(@recipient.id).references.build(reference_params)
      if @reference.save
        redirect_to user_path(current_user), notice: 'Reference was successfully created.'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @reference.update(reference_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @reference.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_reference
    @reference = Reference.find(params[:id])
  end

  def set_owner
    if params[:approver_id]
      @approver = Approver.find(params[:approver_id])
      @photo_owner = @approver
      @approver_present = true
    elsif params[:guardian_id]
      @guardian = Guardian.find(params[:guardian_id])
      @photo_owner = @guardian
      @guardian_present = true
    elsif  params[:recipient_id]
      @recipient = Recipient.find(params[:recipient_id])
      @photo_owner = @recipient
      @recipient_present = true
    end
  end

  def reference_params
    params.require(:reference).permit(:title, :comments, :document, :document_cache)
  end
end
