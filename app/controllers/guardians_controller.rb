class GuardiansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:requested_amount, :category, :purpose, :description, :bank_id)
  end
end
