require 'rails_helper'

RSpec.describe "PartnerDonations", type: :request do
  describe "GET /partner_donations" do
    it "works! (now write some real specs)" do
      get partner_donations_path
      expect(response).to have_http_status(200)
    end
  end
end
