require 'rails_helper'

RSpec.describe "supplies/edit", type: :view do
  before(:each) do
    @supply = assign(:supply, Supply.create!(
      :fuel => "MyString",
      :fleet => nil,
      :liters => 1.5,
      :value => 1.5
    ))
  end

  it "renders the edit supply form" do
    render

    assert_select "form[action=?][method=?]", supply_path(@supply), "post" do

      assert_select "input[name=?]", "supply[fuel]"

      assert_select "input[name=?]", "supply[fleet_id]"

      assert_select "input[name=?]", "supply[liters]"

      assert_select "input[name=?]", "supply[value]"
    end
  end
end
