require "rails_helper"

RSpec.describe ActionPlansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/action_plans").to route_to("action_plans#index")
    end

    it "routes to #new" do
      expect(:get => "/action_plans/new").to route_to("action_plans#new")
    end

    it "routes to #show" do
      expect(:get => "/action_plans/1").to route_to("action_plans#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/action_plans/1/edit").to route_to("action_plans#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/action_plans").to route_to("action_plans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/action_plans/1").to route_to("action_plans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/action_plans/1").to route_to("action_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/action_plans/1").to route_to("action_plans#destroy", :id => "1")
    end

  end
end
