class AccountReceivablesController < ApplicationController
  before_action :set_account_receivable, only: [:show, :edit, :update, :destroy]

  # GET /account_receivables
  # GET /account_receivables.json
  def index
    @account_receivables = AccountReceivable.order(:created_at).page params[:page]

    respond_to do |format|
      format.html
      format.csv {send_data AccountReceivable.to_csv}
    end
  end

  # GET /account_receivables/1
  # GET /account_receivables/1.json
  def show
  end

  # GET /account_receivables/new
  def new
    @account_receivable = AccountReceivable.new
  end

  # GET /account_receivables/1/edit
  def edit
  end

  # POST /account_receivables
  # POST /account_receivables.json
  def create
    @account_receivable = AccountReceivable.new(account_receivable_params)

    respond_to do |format|
      if @account_receivable.save
        format.html { redirect_to @account_receivable, notice: 'Conta a receber criada com sucesso.' }
        format.json { render :show, status: :created, location: @account_receivable }
      else
        format.html { render :new }
        format.json { render json: @account_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_receivables/1
  # PATCH/PUT /account_receivables/1.json
  def update
    respond_to do |format|
      if @account_receivable.update(account_receivable_params)
        format.html { redirect_to @account_receivable, notice: 'Conta a receber foi atualizada' }
        format.json { render :show, status: :ok, location: @account_receivable }
      else
        format.html { render :edit }
        format.json { render json: @account_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_receivables/1
  # DELETE /account_receivables/1.json
  def destroy
    @account_receivable.destroy
    respond_to do |format|
      format.html { redirect_to account_receivables_url, notice: 'Conta a receber foi excluida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_receivable
      @account_receivable = AccountReceivable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_receivable_params
      params.require(:account_receivable).permit(:date, :name, :value, :partner_donations_id)
    end
end
