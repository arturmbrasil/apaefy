require 'rails_helper'

RSpec.describe "medicines/show", type: :view do
  before(:each) do
    @medicine = assign(:medicine, Medicine.create!(
      :name => "Name",
      :dosage => "Dosage",
      :time_interval => "Time Interval",
      :student => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Dosage/)
    expect(rendered).to match(/Time Interval/)
    expect(rendered).to match(//)
  end
end
