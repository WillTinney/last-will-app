class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  # before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]

  def index
    @videos = policy_scope(Video)
    @video = Video.new
    # @assignee = Assignee.find(params[:approver_id] || params[:guardian_id] || params[:recipient_id]) if params[:approver_id] || params[:guardian_id] || params[:recipient_id]
  end

  def show
    authorize @video
  end

  def new
    @video = Video.new
    authorize @video
    # @assignee = Assignee.find(params[:assignee_id]) if params[:assignee_id]
  end

  def create
    @video = current_user.videos.create!(video_params)
    # @video[:user_id] = @assignee.user_id
    authorize @video
    if @video.save
      redirect_to user_path(current_user), notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @video
    # @assignee = Assignee.find(params[:assignee_id]) if params[:assignee_id]
  end

  def update
    authorize @video
    if @video.update(video_params)
      # redirect_to user_assignee_path(current_user, @video.assignee_id)
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

  # def set_assignee
  #   @assignee = Assignee.find(params[:assignee_id] || params[:guardian_id] || params[:recipient_id])
  # end

  def video_params
    params.require(:video).permit(:title, :comments, :video, :assignee_id)
  end
end
