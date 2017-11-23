require 'rails_helper'

RSpec.describe "StudentEvolutions", type: :request do
  describe "GET /student_evolutions" do
    it "works! (now write some real specs)" do
      get student_evolutions_path
      expect(response).to have_http_status(200)
    end
  end
end
