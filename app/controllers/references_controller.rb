class ReferencesController < ApplicationController
   before_action :set_reference, only: [:show, :edit, :update, :destroy]
   before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]

  def index
    @references = policy_scope(Reference)
  end

  def show
    authorize @reference
  end

  def new
    @reference = Reference.new
    authorize @reference
  end

  def create
    @reference = current_user.assignees.find(@assignee.id).references.create!(reference_params)
    @reference[:user_id] = @assignee.user_id
    authorize @reference
    if @reference.save
      redirect_to :back, notice: 'Reference was successfully uploaded.'
    else
      render :new
    end
  end

  def edit
    authorize @reference
  end

  def update
    authorize @reference
    if @reference.update(reference_params)
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    authorize @reference
    @reference.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_reference
    @reference = Reference.find(params[:id])
  end

  def set_assignee
    @assignee = Assignee.find(params[:assignee_id] || params[:approver_id] || params[:guardian_id] || params[:recipient_id])
  end

  def reference_params
    params.require(:reference).permit(:title, :comments, :document)
  end
end
