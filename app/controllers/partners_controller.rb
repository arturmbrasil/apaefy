class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  # GET /partners
  # GET /partners.json
  def index
    @partners = Partner.order(:name).page params[:page]
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
    @donations = @partner.donations
  end

  # GET /partners/new
  def new
    @partner = Partner.new
  end

  # GET /partners/1/edit
  def edit
    @cities = @partner.state.cities.map { |city| [city.name, city.id] } if @partner.city
  end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(partner_params)

    respond_to do |format|
      if @partner.save
        format.html { redirect_to @partner, notice: 'Parceiro cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @partner }
      else
        format.html { render :new }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1
  # PATCH/PUT /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to @partner, notice: 'Parceiro atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner.destroy
    respond_to do |format|
      format.html { redirect_to partners_url, notice: 'Parceiro excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_partner
    @partner = Partner.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def partner_params
    params.require(:partner).permit(:name, :document_cnpj, :document_state_registration, :email, :city_id, :address_street, :address_number, :address_neighborhood, :address_zip_code, phone_numbers: [])
  end
end
