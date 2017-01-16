class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.assignees.find(@assignee.id).notes.create!(note_params)
    if @note.save
      redirect_to :back, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to :back
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

  def set_assignee
    @assignee = Assignee.find(params[:assignee_id] || params[:approver_id] || params[:guardian_id] || params[:recipient_id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :assignee_id)
  end
end
