require 'rails_helper'

RSpec.describe "food_restrictions/show", type: :view do
  before(:each) do
    @food_restriction = assign(:food_restriction, FoodRestriction.create!(
      :restricao => "Restricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Restricao/)
  end
end
