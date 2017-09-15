require 'rails_helper'

RSpec.describe "ActionPlans", type: :request do
  describe "GET /action_plans" do
    it "works! (now write some real specs)" do
      get action_plans_path
      expect(response).to have_http_status(200)
    end
  end
end
