require 'rails_helper'

RSpec.describe "ContaARecebers", type: :request do
  describe "GET /conta_a_recebers" do
    it "works! (now write some real specs)" do
      get conta_a_recebers_path
      expect(response).to have_http_status(200)
    end
  end
end
