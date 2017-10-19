require 'rails_helper'

RSpec.describe "food_restrictions/new", type: :view do
  before(:each) do
    assign(:food_restriction, FoodRestriction.new(
      :restricao => "MyString"
    ))
  end

  it "renders new food_restriction form" do
    render

    assert_select "form[action=?][method=?]", food_restrictions_path, "post" do

      assert_select "input[name=?]", "food_restriction[restricao]"
    end
  end
end
