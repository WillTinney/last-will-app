class ProofsController < ApplicationController
  # protect_from_forgery except: :new
  before_action :set_proof, only: [:show, :edit, :update, :destroy]

  def index
    @proofs = policy_scope(Proof)
    @proof = Proof.new
  end

  def show
    @user = User.find(params[:user_id])
    authorize @proof
  end

  def new
    @proof = Proof.new
    authorize @proof
  end

  def create
    @proof = current_user.proofs.build(proof_params)
    authorize @proof
    if @proof.save
      respond_to do |format|
        format.js
        format.html { redirect_to user_proofs_path(current_user), notice: 'Proof was successfully created.' }
      end
    else
      respond_to do |format|
        format.js
        format.html { render :new }
      end
    end
  end

  def edit
    authorize @proof
  end

  def update
    authorize @proof
    if @proof.update(proof_params)
      redirect_to user_proofs_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    authorize @proof
    @proof.destroy
    redirect_to user_proofs_path(current_user)
  end

  private

  def set_proof
    @proof = Proof.find(params[:id])
  end

  def proof_params
    params.require(:proof).permit(:title, :comments, :document)
  end
end
