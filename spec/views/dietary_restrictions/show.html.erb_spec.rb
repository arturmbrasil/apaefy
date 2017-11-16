require 'rails_helper'

RSpec.describe "dietary_restrictions/show", type: :view do
  before(:each) do
    @dietary_restriction = assign(:dietary_restriction, DietaryRestriction.create!(
      :restriction => "Restriction",
      :student => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Restriction/)
    expect(rendered).to match(//)
  end
end
