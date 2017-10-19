require "rails_helper"

RSpec.describe AbastecimentosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/abastecimentos").to route_to("abastecimentos#index")
    end

    it "routes to #new" do
      expect(:get => "/abastecimentos/new").to route_to("abastecimentos#new")
    end

    it "routes to #show" do
      expect(:get => "/abastecimentos/1").to route_to("abastecimentos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/abastecimentos/1/edit").to route_to("abastecimentos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/abastecimentos").to route_to("abastecimentos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/abastecimentos/1").to route_to("abastecimentos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/abastecimentos/1").to route_to("abastecimentos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/abastecimentos/1").to route_to("abastecimentos#destroy", :id => "1")
    end

  end
end
