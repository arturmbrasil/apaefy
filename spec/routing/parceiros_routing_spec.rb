require "rails_helper"

RSpec.describe ParceirosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/parceiros").to route_to("parceiros#index")
    end

    it "routes to #new" do
      expect(:get => "/parceiros/new").to route_to("parceiros#new")
    end

    it "routes to #show" do
      expect(:get => "/parceiros/1").to route_to("parceiros#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/parceiros/1/edit").to route_to("parceiros#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/parceiros").to route_to("parceiros#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/parceiros/1").to route_to("parceiros#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/parceiros/1").to route_to("parceiros#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/parceiros/1").to route_to("parceiros#destroy", :id => "1")
    end

  end
end
