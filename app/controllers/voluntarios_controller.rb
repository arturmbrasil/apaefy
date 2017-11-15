class VoluntariosController < ApplicationController
  before_action :set_voluntario, only: [:show, :edit, :update, :destroy]

  # GET /voluntarios
  # GET /voluntarios.json
  def index
    @voluntarios = Voluntario.where("nome like ?", "%#{params[:search]}%")
  end

  # GET /voluntarios/1
  # GET /voluntarios/1.json
  def show
  end

  # GET /voluntarios/new
  def new
    @voluntario = Voluntario.new
  end

  # GET /voluntarios/1/edit
  def edit
  end

  # POST /voluntarios
  # POST /voluntarios.json
  def create
    @voluntario = Voluntario.new(voluntario_params)

    respond_to do |format|
      if @voluntario.save
        format.html { redirect_to voluntarios_url, notice: 'Voluntário cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @voluntario }
      else
        format.html { render :new }
        format.json { render json: @voluntario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voluntarios/1
  # PATCH/PUT /voluntarios/1.json
  def update
    respond_to do |format|
      if @voluntario.update(voluntario_params)
        format.html { redirect_to voluntarios_url, notice: 'Voluntario was successfully updated.' }
        format.json { render :show, status: :ok, location: @voluntario }
      else
        format.html { render :edit }
        format.json { render json: @voluntario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voluntarios/1
  # DELETE /voluntarios/1.json
  def destroy
    @voluntario.destroy
    respond_to do |format|
      format.html { redirect_to voluntarios_url, notice: 'Voluntario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def relatorio
    @vol_test = Voluntario.new
  end

  def generate
    @vol_test = Voluntario.new(relatorio_params)
    @voluntarios_exp = @vol_test.relatorio
    respond_to do |format|
      format.html
      format.xlsx { response.headers['Content-Disposition'] = "attachment; filename=\"voluntarios_#{Time.now.to_s}.xlsx\""}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voluntario
      @voluntario = Voluntario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voluntario_params
      params.require(:voluntario).permit(:codigo, :nome, :data_nascimento, :rg, :cpf, :telefone, :usuario, :senha, :sexo, :city_id, :address_street, :address_number, :address_neighborhood, :address_zip_code, :atuacao, :order, :data_inicial, :data_final)
    end

    def relatorio_params
      params.require(:voluntario).permit(:order, :data_inicial, :data_final)
    end
end
