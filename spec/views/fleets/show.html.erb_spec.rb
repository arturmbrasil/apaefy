require 'rails_helper'

RSpec.describe "fleets/show", type: :view do
  before(:each) do
    @fleet = assign(:fleet, Fleet.create!(
      :name => "Name",
      :vehicle => "Vehicle",
      :license_plate => "License Plate",
      :document_renavam => "Document Renavam",
      :chassis => "Chassis",
      :route => "Route",
      :driver_name => "Driver Name",
      :router => "Router"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Vehicle/)
    expect(rendered).to match(/License Plate/)
    expect(rendered).to match(/Document Renavam/)
    expect(rendered).to match(/Chassis/)
    expect(rendered).to match(/Route/)
    expect(rendered).to match(/Driver Name/)
    expect(rendered).to match(/Router/)
  end
end
