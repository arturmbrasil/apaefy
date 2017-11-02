require "rails_helper"

RSpec.describe VoluntariosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/voluntarios").to route_to("voluntarios#index")
    end

    it "routes to #new" do
      expect(:get => "/voluntarios/new").to route_to("voluntarios#new")
    end

    it "routes to #show" do
      expect(:get => "/voluntarios/1").to route_to("voluntarios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/voluntarios/1/edit").to route_to("voluntarios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/voluntarios").to route_to("voluntarios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/voluntarios/1").to route_to("voluntarios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/voluntarios/1").to route_to("voluntarios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/voluntarios/1").to route_to("voluntarios#destroy", :id => "1")
    end

  end
end
