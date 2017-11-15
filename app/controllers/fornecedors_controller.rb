class FornecedorsController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedors
  # GET /fornecedors.json
  def index
    @fornecedors = Fornecedor.where("nome like ?", "%#{params[:search]}%")
  end

  # GET /fornecedors/1
  # GET /fornecedors/1.json
  def show
  end

  # GET /fornecedors/new
  def new
    @fornecedor = Fornecedor.new
  end

  # GET /fornecedors/1/edit
  def edit
    @cities = @fornecedor.state.cities.map { |city| [city.name, city.id] } if @fornecedor.city
  end

  # POST /fornecedors
  # POST /fornecedors.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to fornecedors_url, notice: 'Fornecedor was successfully created.' }
        format.json { render :show, status: :created, location: @fornecedor }
      else
        format.html { render :new }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedors/1
  # PATCH/PUT /fornecedors/1.json
  def update
    respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        format.html { redirect_to fornecedors_url, notice: 'Fornecedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @fornecedor }
      else
        format.html { render :edit }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedors/1
  # DELETE /fornecedors/1.json
  def destroy
    @fornecedor.destroy
    respond_to do |format|
      format.html { redirect_to fornecedors_url, notice: 'Fornecedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def relatorio
    @forn_rel = Fornecedor.new
  end

  def generate
    @forn_rel = Fornecedor.new(fornecedor_params)
    @fornecedors_exp = @forn_rel.relatorio
    respond_to do |format|
      format.html
      format.xlsx { response.headers['Content-Disposition'] = "attachment; filename=\"fornecedores_#{Time.now.to_s}.xlsx\""}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:codigo, :nome, :telefone, :cnpj, :inscricao_estadual, :centro_custo, :numero_log, :bairro, :email, :logradouro, :city_id, :site, :order)
    end

    def relatorio_params
      params.require(:fornecedor).permit(:order, :city_id)
    end
end
