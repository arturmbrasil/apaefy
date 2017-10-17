class FrotasController < ApplicationController
  before_action :set_frota, only: [:show, :edit, :update, :destroy]

  # GET /frotas
  # GET /frotas.json
  def index
    @frotas = Frota.all
  end

  # GET /frotas/1
  # GET /frotas/1.json
  def show
  end

  # GET /frotas/new
  def new
    @frota = Frota.new
  end

  # GET /frotas/1/edit
  def edit
  end

  # POST /frotas
  # POST /frotas.json
  def create
    @frota = Frota.new(frota_params)

    respond_to do |format|
      if @frota.save
        format.html { redirect_to @frota, notice: 'Frota foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @frota }
      else
        format.html { render :new }
        format.json { render json: @frota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frotas/1
  # PATCH/PUT /frotas/1.json
  def update
    respond_to do |format|
      if @frota.update(frota_params)
        format.html { redirect_to @frota, notice: 'Frota foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @frota }
      else
        format.html { render :edit }
        format.json { render json: @frota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frotas/1
  # DELETE /frotas/1.json
  def destroy
    @frota.destroy
    respond_to do |format|
      format.html { redirect_to frotas_url, notice: 'Frota foi excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frota
      @frota = Frota.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frota_params
      params.require(:frota).permit(:nome, :veiculo, :placa, :renavam, :chassi, :rota, :motorista, :roteirista)
    end
end
