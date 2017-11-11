class ContaARecebersController < ApplicationController
  before_action :set_conta_a_receber, only: [:show, :edit, :update, :destroy]

  # GET /conta_a_recebers
  # GET /conta_a_recebers.json
  def index
    @conta_a_recebers = ContaAReceber.all
  end

  # GET /conta_a_recebers/1
  # GET /conta_a_recebers/1.json
  def show
  end

  # GET /conta_a_recebers/new
  def new
    @conta_a_receber = ContaAReceber.new
  end

  # GET /conta_a_recebers/1/edit
  def edit
  end

  # POST /conta_a_recebers
  # POST /conta_a_recebers.json
  def create
    @conta_a_receber = ContaAReceber.new(conta_a_receber_params)

    respond_to do |format|
      if @conta_a_receber.save
        format.html { redirect_to @conta_a_receber, notice: 'Conta a receber criada com sucesso!' }
        format.json { render :show, status: :created, location: @conta_a_receber }
      else
        format.html { render :new }
        format.json { render json: @conta_a_receber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conta_a_recebers/1
  # PATCH/PUT /conta_a_recebers/1.json
  def update
    respond_to do |format|
      if @conta_a_receber.update(conta_a_receber_params)
        format.html { redirect_to @conta_a_receber, notice: 'Conta a receber alterada com sucesso!' }
        format.json { render :show, status: :ok, location: @conta_a_receber }
      else
        format.html { render :edit }
        format.json { render json: @conta_a_receber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conta_a_recebers/1
  # DELETE /conta_a_recebers/1.json
  def destroy
    @conta_a_receber.destroy
    respond_to do |format|
      format.html { redirect_to conta_a_recebers_url, notice: 'Conta a receber excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta_a_receber
      @conta_a_receber = ContaAReceber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conta_a_receber_params
      params.require(:conta_a_receber).permit(:data, :nome, :valor, :doacao_id)
    end
end
