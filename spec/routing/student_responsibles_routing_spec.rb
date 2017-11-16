require "rails_helper"

RSpec.describe StudentResponsiblesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/student_responsibles").to route_to("student_responsibles#index")
    end

    it "routes to #new" do
      expect(:get => "/student_responsibles/new").to route_to("student_responsibles#new")
    end

    it "routes to #show" do
      expect(:get => "/student_responsibles/1").to route_to("student_responsibles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/student_responsibles/1/edit").to route_to("student_responsibles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/student_responsibles").to route_to("student_responsibles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/student_responsibles/1").to route_to("student_responsibles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/student_responsibles/1").to route_to("student_responsibles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/student_responsibles/1").to route_to("student_responsibles#destroy", :id => "1")
    end

  end
end
