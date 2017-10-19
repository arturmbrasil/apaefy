require 'rails_helper'

RSpec.describe "food_restrictions/index", type: :view do
  before(:each) do
    assign(:food_restrictions, [
      FoodRestriction.create!(
        :restricao => "Restricao"
      ),
      FoodRestriction.create!(
        :restricao => "Restricao"
      )
    ])
  end

  it "renders a list of food_restrictions" do
    render
    assert_select "tr>td", :text => "Restricao".to_s, :count => 2
  end
end
