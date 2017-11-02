require 'rails_helper'

RSpec.describe "Frotas", type: :request do
  describe "GET /frotas" do
    it "works! (now write some real specs)" do
      get frotas_path
      expect(response).to have_http_status(200)
    end
  end
end
