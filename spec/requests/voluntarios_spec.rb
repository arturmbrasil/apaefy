require 'rails_helper'

RSpec.describe "Voluntarios", type: :request do
  describe "GET /voluntarios" do
    it "works! (now write some real specs)" do
      get voluntarios_path
      expect(response).to have_http_status(200)
    end
  end
end
