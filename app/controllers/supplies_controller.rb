class SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :edit, :update, :destroy]

  # GET /supplies
  # GET /supplies.json
  def index
    @supplies = Supply.order(:created_at).includes(:fleet).page params[:page]

    respond_to do |format|
      format.html
      format.csv { send_data Supply.to_csv }
    end
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show
  end

  # GET /supplies/new
  def new
    @supply = Supply.new
    options_for_select
  end

  # GET /supplies/1/edit
  def edit
    options_for_select
  end

  # POST /supplies
  # POST /supplies.json
  def create
    @supply = Supply.new(supply_params)
    options_for_select

    respond_to do |format|
      if @supply.save
        format.html { redirect_to supplies_url, notice: 'Abastecimento cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @supply }
      else
        format.html { render :new }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    respond_to do |format|
      if @supply.update(supply_params)
        format.html { redirect_to supplies_url, notice: 'Abastecimento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @supply }
      else
        format.html { render :edit }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @supply.destroy
    respond_to do |format|
      format.html { redirect_to supplies_url, notice: 'Abastecimento excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  def options_for_select
    @fleet_options_for_select = Fleet.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_supply
    @supply = Supply.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def supply_params
    params.require(:supply).permit(:fuel, :fleet_id, :liters, :value, :supply_date)
  end
end
