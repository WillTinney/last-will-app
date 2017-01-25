class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]

  def index
    @notes = policy_scope(Note)
  end

  def new
    @note = Note.new
    authorize @note
  end

  def create
    @note = current_user.assignees.find(@assignee.id).notes.create!(note_params)
    @note[:user_id] = @assignee.user_id
    authorize @note
    if @note.save
      redirect_to :back, notice: 'Note was successfully created.'
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
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    authorize @note
    @note.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def set_assignee
    @assignee = Assignee.find(params[:assignee_id] || params[:approver_id] || params[:guardian_id] || params[:recipient_id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :assignee_id)
  end
end
