require 'rails_helper'

RSpec.describe "AccountReceivables", type: :request do
  describe "GET /account_receivables" do
    it "works! (now write some real specs)" do
      get account_receivables_path
      expect(response).to have_http_status(200)
    end
  end
end
