class NotesController < ApplicationController
   before_action :set_note, only: [:edit, :update, :destroy]
   before_action :set_owner, only: [:new, :create, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    if @approver
      @note = current_user.approvers.find(@approver.id).notes.build(note_params)
      if @note.save
        redirect_to user_path(current_user), notice: 'Note was successfully created.'
      else
        render :new
      end
    elsif @guardian
      @note = current_user.guardians.find(@guardian.id).notes.build(note_params)
      if @note.save
        redirect_to user_path(current_user), notice: 'Note was successfully created.'
      else
        render :new
      end
    elsif @recipient
      @note = current_user.recipients.find(@recipient.id).notes.build(note_params)
      if @note.save
        redirect_to user_path(current_user), notice: 'Note was successfully created.'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def set_owner
    if params[:approver_id]
      @approver = Approver.find(params[:approver_id])
      @owner = @appover
      @approver_present = true
    elsif params[:guardian_id]
      @guardian = Guardian.find(params[:guardian_id])
      @owner = @guardian
      @guardian_present = true
    elsif  params[:recipient_id]
      @recipient = Recipient.find(params[:recipient_id])
      @owner = @recipient
      @recipient_present = true
    end
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
