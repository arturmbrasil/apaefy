class PartnerDonationsController < ApplicationController
  before_action :set_partner_donation, only: [:show, :edit, :update, :destroy]

  # GET /partner_donations
  # GET /partner_donations.json
  def index
    @partner_donations = PartnerDonation.all
  end

  # GET /partner_donations/1
  # GET /partner_donations/1.json
  def show
  end

  # GET /partner_donations/new
  def new
    @partner_donation = PartnerDonation.new
  end

  # GET /partner_donations/1/edit
  def edit
  end

  # POST /partner_donations
  # POST /partner_donations.json
  def create
    @partner_donation = PartnerDonation.new(partner_donation_params)

    respond_to do |format|
      if @partner_donation.save
        format.html { redirect_to @partner_donation, notice: 'Partner donation was successfully created.' }
        format.json { render json: @partner_donation, location: @partner_donation }
      else
        format.html { render :new }
        format.json { render json: @partner_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partner_donations/1
  # PATCH/PUT /partner_donations/1.json
  def update
    respond_to do |format|
      if @partner_donation.update(partner_donation_params)
        format.html { redirect_to @partner_donation, notice: 'Partner donation was successfully updated.' }
        format.json { render json: @partner_donation, status: :ok, location: @partner_donation }
      else
        format.html { render :edit }
        format.json { render json: @partner_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partner_donations/1
  # DELETE /partner_donations/1.json
  def destroy
    @partner_donation.destroy
    respond_to do |format|
      format.html { redirect_to partner_donations_url, notice: 'Partner donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner_donation
      @partner_donation = PartnerDonation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_donation_params
      params.require(:partner_donation).permit(:value, :payment_type, :item, :partner_id)
    end
end
