class PhotosController < ApplicationController
   before_action :set_photo, only: [:edit, :update, :destroy]
   before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.assignees.find(@assignee.id).photos.create!(photo_params)
    @photo[:user_id] = @assignee.user_id
    if @photo.save
      redirect_to :back, notice: 'Photo was successfully uploaded.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to :back
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def set_assignee
    @assignee = Assignee.find(params[:assignee_id] || params[:approver_id] || params[:guardian_id] || params[:recipient_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :caption, :photo)
  end
end
