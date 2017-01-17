class CallToActionController < ApplicationController
  before_action :set_call_to_action, only: [:index, :edit, :update, :destroy]

  def index
    @new_call_to_action = CallToAction.new
  end

  def new
    @call_to_action
  end

  def create
    @call_to_action = CallToAction.create!(call_to_action_params)
    @call_to_action[:user_id] = @user.id
    if @call_to_action.save
      redirect_to :back, notice: 'Call to Action was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @call_to_action.update(call_to_action_params)
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    @call_to_action.destroy
    redirect_to user_path(@user)
  end

  def approve_release
  end


  private

  def set_call_to_action
    @call_to_action = @user.call_to_action if @user.call_to_action
  end

  def call_to_action_params
    params.require(:call_to_action).permit(:event, :event_type, :release_date,
      :approver_confirmation, :approver_count)
  end
end
