class NotesController < ApplicationController
   before_action :set_note, only: [:edit, :update, :destroy]
   before_action :set_approver, only: [:new, :create, :edit, :update, :destroy]
   before_action :set_guardian, only: [:new, :create, :edit, :update, :destroy]
   before_action :set_recipient, only: [:new, :create, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to user_path(current_user), notice: 'Note was successfully created.'
    else
      render :new
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

  def set_approver
    @approver = Approver.find(params[:approver_id])
  end

  def set_guardian
    @guardian = Guardian.find(params[:guardian_id])
  end

  def set_recipient
    @recipient = Recipient.find(params[:recipient_id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
