require "rails_helper"

RSpec.describe ColaboradorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/colaboradors").to route_to("colaboradors#index")
    end

    it "routes to #new" do
      expect(:get => "/colaboradors/new").to route_to("colaboradors#new")
    end

    it "routes to #show" do
      expect(:get => "/colaboradors/1").to route_to("colaboradors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/colaboradors/1/edit").to route_to("colaboradors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/colaboradors").to route_to("colaboradors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/colaboradors/1").to route_to("colaboradors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/colaboradors/1").to route_to("colaboradors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/colaboradors/1").to route_to("colaboradors#destroy", :id => "1")
    end

  end
end
