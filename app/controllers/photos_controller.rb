class PhotosController < ApplicationController
   before_action :set_photo, only: [:show, :edit, :update, :destroy]
   before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]

  def index
    @photos = policy_scope(Photo)
  end

  def show
    authorize @photo
  end

  def new
    @photo = Photo.new
    authorize @photo
  end

  def create
    @photo = current_user.assignees.find(@assignee.id).photos.create!(photo_params)
    @photo[:user_id] = @assignee.user_id
    authorize @photo
    if @photo.save
      redirect_to :back, notice: 'Photo was successfully uploaded.'
    else
      render :new
    end
  end

  def edit
    authorize @photo
  end

  def update
    authorize @photo
    if @photo.update(photo_params)
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    authorize @photo
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
