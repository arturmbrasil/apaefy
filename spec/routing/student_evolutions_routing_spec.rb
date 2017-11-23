require "rails_helper"

RSpec.describe StudentEvolutionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/student_evolutions").to route_to("student_evolutions#index")
    end

    it "routes to #new" do
      expect(:get => "/student_evolutions/new").to route_to("student_evolutions#new")
    end

    it "routes to #show" do
      expect(:get => "/student_evolutions/1").to route_to("student_evolutions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/student_evolutions/1/edit").to route_to("student_evolutions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/student_evolutions").to route_to("student_evolutions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/student_evolutions/1").to route_to("student_evolutions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/student_evolutions/1").to route_to("student_evolutions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/student_evolutions/1").to route_to("student_evolutions#destroy", :id => "1")
    end

  end
end
