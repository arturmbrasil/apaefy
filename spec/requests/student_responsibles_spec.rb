require 'rails_helper'

RSpec.describe "StudentResponsibles", type: :request do
  describe "GET /student_responsibles" do
    it "works! (now write some real specs)" do
      get student_responsibles_path
      expect(response).to have_http_status(200)
    end
  end
end
