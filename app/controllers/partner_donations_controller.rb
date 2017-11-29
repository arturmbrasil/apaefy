class PartnerDonationsController < ApplicationController
  before_action :set_partner_donation, only: [:destroy]

  def index
    respond_to do |format|
      format.csv { send_data PartnerDonation.to_csv }
    end
  end

  def create
    @partner_donation = PartnerDonation.new(partner_donation_params)

    account_receivable = AccountReceivable.new
    account_receivable.name = @partner_donation.payment_type
    account_receivable.value = @partner_donation.value
    account_receivable.date = Date.today
    account_receivable.save

    respond_to do |format|
      if @partner_donation.save
        format.html { redirect_to @partner_donation, notice: 'Doação cadastrada com sucesso.' }
        format.json { render json: @partner_donation, location: @partner_donation }
      else
        format.html { render :new }
        format.json { render json: @partner_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @partner_donation.destroy
    respond_to do |format|
      format.html { redirect_to partner_path(@partner_donation.partner_id), notice: 'Doação deletada com sucesso.' }
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
