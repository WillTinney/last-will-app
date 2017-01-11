class VideosController < ApplicationController
  before_action :set_video, only: [:edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to user_path(current_user), notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
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
