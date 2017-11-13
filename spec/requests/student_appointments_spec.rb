require 'rails_helper'

RSpec.describe "StudentAppointments", type: :request do
  describe "GET /student_appointments" do
    it "works! (now write some real specs)" do
      get student_appointments_path
      expect(response).to have_http_status(200)
    end
  end
end
