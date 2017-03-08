class ReferencesController < ApplicationController
  before_action :set_reference, only: [:edit, :update, :destroy]
  # before_action :set_assignee, only: [:new, :create, :edit, :update, :destroy]

  def index
    @references = policy_scope(Reference)
    @reference = Reference.new
    @assignee = Assignee.find(params[:approver_id] || params[:guardian_id] || params[:recipient_id]) if params[:approver_id] || params[:guardian_id] || params[:recipient_id]
  end

  def new
    @reference = Reference.new
    authorize @reference
    @assignee = Assignee.find(params[:assignee_id]) if params[:assignee_id]
  end

  def create
    @reference = current_user.references.create!(reference_params)
    # @reference[:user_id] = @assignee.user_id
    authorize @reference
    if @reference.save
      redirect_to user_references_path(current_user), notice: 'Reference was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @reference
    @assignee = Assignee.find(params[:assignee_id]) if params[:assignee_id]
  end

  def update
    authorize @reference
    if @reference.update(reference_params)
      # redirect_to user_assignee_path(current_user, @reference.assignee_id)
      redirect_to user_references_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    authorize @reference
    @reference.destroy
    redirect_to user_references_path(current_user)
  end

  private

  def set_reference
    @reference = Reference.find(params[:id])
  end

  # def set_assignee
  #   @assignee = Assignee.find(params[:assignee_id] || params[:guardian_id] || params[:recipient_id])
  # end

  def reference_params
    params.require(:reference).permit(:title, :caption, :reference, :assignee_id)
  end
end
