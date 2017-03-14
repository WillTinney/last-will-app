class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  # before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]

  def index
    @photos = policy_scope(Photo)
    @photo = Photo.new
    @assignee = Assignee.find(params[:approver_id] || params[:guardian_id] || params[:recipient_id]) if params[:approver_id] || params[:guardian_id] || params[:recipient_id]
  end

  def show
    authorize @photo
  end

  def new
    @photo = Photo.new
    authorize @photo
    @assignee = Assignee.find(params[:assignee_id]) if params[:assignee_id]
  end

  def create
    @photo = current_user.photos.create!(photo_params)
    # @photo[:user_id] = @assignee.user_id
    authorize @photo
    if @photo.save
      redirect_to user_path(current_user), notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @photo
    @assignee = Assignee.find(params[:assignee_id]) if params[:assignee_id]
  end

  def update
    authorize @photo
    if @photo.update(photo_params)
      # redirect_to user_assignee_path(current_user, @photo.assignee_id)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    authorize @photo
    @photo.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  # def set_assignee
  #   @assignee = Assignee.find(params[:assignee_id] || params[:guardian_id] || params[:recipient_id])
  # end

  def photo_params
    params.require(:photo).permit(:title, :caption, :photo, :assignee_id)
  end
end
