require 'rails_helper'

RSpec.describe "fleets/index", type: :view do
  before(:each) do
    assign(:fleets, [
      Fleet.create!(
        :name => "Name",
        :vehicle => "Vehicle",
        :license_plate => "License Plate",
        :document_renavam => "Document Renavam",
        :chassis => "Chassis",
        :route => "Route",
        :driver_name => "Driver Name",
        :router => "Router"
      ),
      Fleet.create!(
        :name => "Name",
        :vehicle => "Vehicle",
        :license_plate => "License Plate",
        :document_renavam => "Document Renavam",
        :chassis => "Chassis",
        :route => "Route",
        :driver_name => "Driver Name",
        :router => "Router"
      )
    ])
  end

  it "renders a list of fleets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Vehicle".to_s, :count => 2
    assert_select "tr>td", :text => "License Plate".to_s, :count => 2
    assert_select "tr>td", :text => "Document Renavam".to_s, :count => 2
    assert_select "tr>td", :text => "Chassis".to_s, :count => 2
    assert_select "tr>td", :text => "Route".to_s, :count => 2
    assert_select "tr>td", :text => "Driver Name".to_s, :count => 2
    assert_select "tr>td", :text => "Router".to_s, :count => 2
  end
end
