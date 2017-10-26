class AbastecimentosController < ApplicationController
  before_action :set_abastecimento, only: [:show, :edit, :update, :destroy]

  # GET /abastecimentos
  # GET /abastecimentos.json
  def index
    @abastecimentos = Abastecimento.includes(:frota)
    # @abastecimentos = Abastecimento.all
    @abastecimentos = Abastecimento.where("upper(combustivel) like upper(?)", "%#{params[:search]}%")
  end

  # GET /abastecimentos/1
  # GET /abastecimentos/1.json
  def show
  end

  # GET /abastecimentos/new
  def new
    @abastecimento = Abastecimento.new
    options_for_select
  end

  # GET /abastecimentos/1/edit
  def edit
    options_for_select
  end

  # POST /abastecimentos
  # POST /abastecimentos.json
  def create
    @abastecimento = Abastecimento.new(abastecimento_params)
    options_for_select

    respond_to do |format|
      if @abastecimento.save
        format.html { redirect_to @abastecimento, notice: 'Abastecimento foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @abastecimento }
      else
        format.html { render :new }
        format.json { render json: @abastecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abastecimentos/1
  # PATCH/PUT /abastecimentos/1.json
  def update
    respond_to do |format|
      if @abastecimento.update(abastecimento_params)
        format.html { redirect_to @abastecimento, notice: 'Abastecimento foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @abastecimento }
      else
        format.html { render :edit }
        format.json { render json: @abastecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abastecimentos/1
  # DELETE /abastecimentos/1.json
  def destroy
    @abastecimento.destroy
    respond_to do |format|
      format.html { redirect_to abastecimentos_url, notice: 'Abastecimento foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

 def search(param)
    if param
      @abastecimentos = Abastecimento.where("upper(combustivel) like upper(?) or codigo = ? ", "%#{param}%", param);
    else
      @abastecimentos = Abastecimento.all;
    end
  end
  
  private

    def options_for_select
      @abastecimentos = Abastecimento.includes(:frota)
      @frota_options_for_select = Frota.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_abastecimento
      @abastecimento = Abastecimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def abastecimento_params
      params.require(:abastecimento).permit(:combustivel, :frota_id, :litros, :valor, :data_abastecimento)
    end
end
