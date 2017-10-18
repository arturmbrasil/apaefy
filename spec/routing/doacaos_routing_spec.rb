require "rails_helper"

RSpec.describe DoacaosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/doacaos").to route_to("doacaos#index")
    end

    it "routes to #new" do
      expect(:get => "/doacaos/new").to route_to("doacaos#new")
    end

    it "routes to #show" do
      expect(:get => "/doacaos/1").to route_to("doacaos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/doacaos/1/edit").to route_to("doacaos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/doacaos").to route_to("doacaos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/doacaos/1").to route_to("doacaos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/doacaos/1").to route_to("doacaos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/doacaos/1").to route_to("doacaos#destroy", :id => "1")
    end

  end
end
