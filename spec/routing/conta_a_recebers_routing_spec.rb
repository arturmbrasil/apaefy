require "rails_helper"

RSpec.describe ContaARecebersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/conta_a_recebers").to route_to("conta_a_recebers#index")
    end

    it "routes to #new" do
      expect(:get => "/conta_a_recebers/new").to route_to("conta_a_recebers#new")
    end

    it "routes to #show" do
      expect(:get => "/conta_a_recebers/1").to route_to("conta_a_recebers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/conta_a_recebers/1/edit").to route_to("conta_a_recebers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/conta_a_recebers").to route_to("conta_a_recebers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/conta_a_recebers/1").to route_to("conta_a_recebers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/conta_a_recebers/1").to route_to("conta_a_recebers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/conta_a_recebers/1").to route_to("conta_a_recebers#destroy", :id => "1")
    end

  end
end
