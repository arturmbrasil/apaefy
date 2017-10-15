require 'rails_helper'

RSpec.describe "Doacaos", type: :request do
  describe "GET /doacaos" do
    it "works! (now write some real specs)" do
      get doacaos_path
      expect(response).to have_http_status(200)
    end
  end
end
