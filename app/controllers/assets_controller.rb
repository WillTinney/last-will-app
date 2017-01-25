class AssetsController < ApplicationController
   before_action :set_asset, only: [:show, :edit, :update, :destroy]
   before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]

  def index
    @assets = Asset.all
  end

  def show
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = current_user.assignees.find(@assignee.id).assets.create!(asset_params)
    @asset[:user_id] = @assignee.user_id
    if @asset.save
      redirect_to :back, notice: 'Asset was successfully uploaded.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @asset.update(asset_params)
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    @asset.destroy
    redirect_to :back
  end

  private

  def set_asset
    @asset = Asset.find(params[:id])
  end

  def set_assignee
    @assignee = Assignee.find(params[:assignee_id] || params[:approver_id] || params[:guardian_id] || params[:recipient_id])
  end

  def asset_params
    params.require(:asset).permit(:title, :caption, :asset)
  end
end
