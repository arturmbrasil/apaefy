class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]
  before_action :permit_user

  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all.includes(:student).includes(:user)
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: 'Empréstimo criado com sucesso!' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: 'Empréstimo alterado com sucesso!' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Empréstimo excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_loan
    @loan = Loan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def loan_params
    params.require(:loan).permit(:student_id, :user_id, :loan_date, :return_date, product_ids: [])
  end

  def permit_user
    permited_roles = ['director', 'warehouse', 'therapist']

    unless permited_roles.include? current_user.role
      redirect_to root_path
    end
  end
end
