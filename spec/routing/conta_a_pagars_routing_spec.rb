require "rails_helper"

RSpec.describe ContaAPagarsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/conta_a_pagars").to route_to("conta_a_pagars#index")
    end

    it "routes to #new" do
      expect(:get => "/conta_a_pagars/new").to route_to("conta_a_pagars#new")
    end

    it "routes to #show" do
      expect(:get => "/conta_a_pagars/1").to route_to("conta_a_pagars#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/conta_a_pagars/1/edit").to route_to("conta_a_pagars#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/conta_a_pagars").to route_to("conta_a_pagars#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/conta_a_pagars/1").to route_to("conta_a_pagars#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/conta_a_pagars/1").to route_to("conta_a_pagars#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/conta_a_pagars/1").to route_to("conta_a_pagars#destroy", :id => "1")
    end

  end
end
