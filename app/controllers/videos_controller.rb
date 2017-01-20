class VideosController < ApplicationController
  before_action :set_video, only: [:edit, :update, :destroy]

  def index
    @videos = policy_scope(Video)
  end

  def show
    authorize @video
  end

  def new
    @video = Video.new
    authorize @video
  end

  def create
    @video = current_user.videos.build(video_params)
    authorize @video
    if @video.save
      redirect_to user_path(current_user), notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @video
  end

  def update
    authorize @video
    if @video.update(video_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    authorize @video
    @video.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_video
    @video = video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :video)
  end
end
