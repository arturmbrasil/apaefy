class AccountPaysController < ApplicationController
  before_action :set_account_pay, only: [:show, :edit, :update, :destroy]

  # GET /account_pays
  # GET /account_pays.json
  def index
    @account_pay = AccountPay.order(:created_at).page params[:page]

    respond_to do |format|
      format.html
      format.csv {send_data AccountPay.to_csv}
    end
  end

  # GET /account_pays/1
  # GET /account_pays/1.json
  def show
  end

  # GET /account_pays/new
  def new
    @account_pay = AccountPay.new
  end

  # GET /account_pays/1/edit
  def edit
  end

  # POST /account_pays
  # POST /account_pays.json
  def create
    numeroParcelas =  account_pay_params[:num_parcela]
    valorParcela = account_pay_params[:value].to_s.to_f / numeroParcelas.to_s.to_i
    dataDeVencimento = account_pay_params[:date];
    if numeroParcelas.to_s.to_i > 1
      (1..numeroParcelas.to_s.to_i).each {|i|
        @account_pay = AccountPay.new(account_pay_params)
        @account_pay.num_parcela = i.to_s + "/" + numeroParcelas
        @account_pay.value = valorParcela.to_s.to_f.round(2)
        @account_pay.date = dataDeVencimento.to_s.to_date + 30;
        dataDeVencimento = @account_pay.date
        @account_pay.save
      }
    else
      @account_pay = AccountPay.new(account_pay_params)
    end

    respond_to do |format|
      if @account_pay.save
        format.html { redirect_to @account_pay, notice: 'Conta a pagar criada com sucesso.' }
        format.json { render :show, status: :created, location: @account_pay }
      else
        format.html { render :new }
        format.json { render json: @account_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_pays/1
  # PATCH/PUT /account_pays/1.json
  def update
    respond_to do |format|
      if @account_pay.update(account_pay_params)
        format.html { redirect_to @account_pay, notice: 'Conta a pagar atualizada.' }
        format.json { render :show, status: :ok, location: @account_pay }
      else
        format.html { render :edit }
        format.json { render json: @account_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_pays/1
  # DELETE /account_pays/1.json
  def destroy
    @account_pay.destroy
    respond_to do |format|
      format.html { redirect_to account_pays_url, notice: 'Conta a pagar foi excluída.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_pay
      @account_pay = AccountPay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_pay_params
      params.require(:account_pay).permit(:name, :date, :nr_nota, :num_parcela, :value)
    end
end
