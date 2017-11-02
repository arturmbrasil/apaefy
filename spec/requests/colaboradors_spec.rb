require 'rails_helper'

RSpec.describe "Colaboradors", type: :request do
  describe "GET /colaboradors" do
    it "works! (now write some real specs)" do
      get colaboradors_path
      expect(response).to have_http_status(200)
    end
  end
end
