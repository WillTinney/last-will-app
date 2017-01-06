class PhotosController < ApplicationController
   before_action :set_photo, only: [:edit, :update, :destroy]
   before_action :set_owner, only: [:new, :create, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    if @approver
      @photo = current_user.approvers.find(@approver.id).photos.build(photo_params)
      if @photo.save
        redirect_to user_path(current_user), notice: 'Photo was successfully created.'
      else
        render :new
      end
    elsif @guardian
      @photo = current_user.guardians.find(@guardian.id).photos.build(photo_params)
      if @photo.save
        redirect_to user_path(current_user), notice: 'Photo was successfully created.'
      else
        render :new
      end
    elsif @recipient
      @photo = current_user.recipients.find(@recipient.id).photos.build(photo_params)
      if @photo.save
        redirect_to user_path(current_user), notice: 'Photo was successfully created.'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def set_owner
    if params[:approver_id]
      @approver = Approver.find(params[:approver_id])
      @approver_present = true
    elsif params[:guardian_id]
      @guardian = Guardian.find(params[:guardian_id])
      @guardian_present = true
    elsif  params[:recipient_id]
      @recipient = Recipient.find(params[:recipient_id])
      @recipient_present = true
    end
  end

  def photo_params
    params.require(:photo).permit(:title, :caption, :photo, :photo_cache)
  end
end
