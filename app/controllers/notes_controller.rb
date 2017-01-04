class NotesController < ApplicationController
   before_action :set_note, only: [:edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def create
    @note = current_user.guardians.build(guardian_params)
    if @note.save
      redirect_to user_path(current_user), notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(guardian_params)
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

  def user_params
    params.require(:note).permit(:title, :content)
  end
end
