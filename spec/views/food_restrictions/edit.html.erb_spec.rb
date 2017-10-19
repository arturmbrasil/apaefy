require 'rails_helper'

RSpec.describe "food_restrictions/edit", type: :view do
  before(:each) do
    @food_restriction = assign(:food_restriction, FoodRestriction.create!(
      :restricao => "MyString"
    ))
  end

  it "renders the edit food_restriction form" do
    render

    assert_select "form[action=?][method=?]", food_restriction_path(@food_restriction), "post" do

      assert_select "input[name=?]", "food_restriction[restricao]"
    end
  end
end
