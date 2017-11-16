require 'rails_helper'

RSpec.describe "DietaryRestrictions", type: :request do
  describe "GET /dietary_restrictions" do
    it "works! (now write some real specs)" do
      get dietary_restrictions_path
      expect(response).to have_http_status(200)
    end
  end
end
