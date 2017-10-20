require 'rails_helper'

RSpec.describe "Abastecimentos", type: :request do
  describe "GET /abastecimentos" do
    it "works! (now write some real specs)" do
      get abastecimentos_path
      expect(response).to have_http_status(200)
    end
  end
end
