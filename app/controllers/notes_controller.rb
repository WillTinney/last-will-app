class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :destroy]
  # before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]

  def index
    @notes = policy_scope(Note)
    @note = Note.new
    @assignee = Assignee.find(params[:approver_id] || params[:guardian_id] || params[:recipient_id] || params[:assignee_id]) if params[:approver_id] || params[:guardian_id] || params[:recipient_id] || params[:assignee_id]
  end

  def new
    @note = Note.new
    authorize @note
    @assignee = Assignee.find(params[:assignee_id]) if params[:assignee_id]
  end

  def create
    @note = current_user.notes.create!(note_params)
    authorize @note
    if @note.save
      if @note.assignee_id
        redirect_to user_assignee_path(current_user, @note.assignee_id), notice: 'Note was successfully created.'
      else
        redirect_to user_path(current_user), notice: 'Note was successfully created.'
      end
    else
      render :new
    end
  end

  def edit
    authorize @note
  end

  def update
    authorize @note
    if @note.update(note_params)
      if @note.assignee_id
        redirect_to user_assignee_path(current_user, @note.assignee_id), notice: 'Note was successfully updated.'
      else
        redirect_to user_path(current_user), notice: 'Note was successfully updated.'
      end
    else
      render :edit
    end
  end

  def destroy
    authorize @note
    @note.destroy
    if @note.assignee_id
      redirect_to user_assignee_path(current_user, @note.assignee_id), notice: 'Note was successfully deleted.'
    else
      redirect_to user_path(current_user), notice: 'Note was successfully deleted.'
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  # def set_assignee
  #   @assignee = Assignee.find(params[:assignee_id] || params[:guardian_id] || params[:recipient_id])
  # end

  def note_params
    params.require(:note).permit(:title, :content, :assignee_id)
  end
end
