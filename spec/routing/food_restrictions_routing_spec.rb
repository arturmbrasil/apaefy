require "rails_helper"

RSpec.describe FoodRestrictionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/food_restrictions").to route_to("food_restrictions#index")
    end

    it "routes to #new" do
      expect(:get => "/food_restrictions/new").to route_to("food_restrictions#new")
    end

    it "routes to #show" do
      expect(:get => "/food_restrictions/1").to route_to("food_restrictions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/food_restrictions/1/edit").to route_to("food_restrictions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/food_restrictions").to route_to("food_restrictions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/food_restrictions/1").to route_to("food_restrictions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/food_restrictions/1").to route_to("food_restrictions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/food_restrictions/1").to route_to("food_restrictions#destroy", :id => "1")
    end

  end
end
