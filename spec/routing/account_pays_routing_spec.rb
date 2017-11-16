require "rails_helper"

RSpec.describe AccountPaysController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/account_pays").to route_to("account_pays#index")
    end

    it "routes to #new" do
      expect(:get => "/account_pays/new").to route_to("account_pays#new")
    end

    it "routes to #show" do
      expect(:get => "/account_pays/1").to route_to("account_pays#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/account_pays/1/edit").to route_to("account_pays#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/account_pays").to route_to("account_pays#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/account_pays/1").to route_to("account_pays#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/account_pays/1").to route_to("account_pays#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/account_pays/1").to route_to("account_pays#destroy", :id => "1")
    end

  end
end
