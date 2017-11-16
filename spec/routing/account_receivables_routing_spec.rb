require "rails_helper"

RSpec.describe AccountReceivablesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/account_receivables").to route_to("account_receivables#index")
    end

    it "routes to #new" do
      expect(:get => "/account_receivables/new").to route_to("account_receivables#new")
    end

    it "routes to #show" do
      expect(:get => "/account_receivables/1").to route_to("account_receivables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/account_receivables/1/edit").to route_to("account_receivables#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/account_receivables").to route_to("account_receivables#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/account_receivables/1").to route_to("account_receivables#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/account_receivables/1").to route_to("account_receivables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/account_receivables/1").to route_to("account_receivables#destroy", :id => "1")
    end

  end
end
