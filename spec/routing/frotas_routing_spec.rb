require "rails_helper"

RSpec.describe FrotasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/frotas").to route_to("frotas#index")
    end

    it "routes to #new" do
      expect(:get => "/frotas/new").to route_to("frotas#new")
    end

    it "routes to #show" do
      expect(:get => "/frotas/1").to route_to("frotas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/frotas/1/edit").to route_to("frotas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/frotas").to route_to("frotas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/frotas/1").to route_to("frotas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/frotas/1").to route_to("frotas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/frotas/1").to route_to("frotas#destroy", :id => "1")
    end

  end
end
