require 'rails_helper'

RSpec.describe "supplies/new", type: :view do
  before(:each) do
    assign(:supply, Supply.new(
      :fuel => "MyString",
      :fleet => nil,
      :liters => 1.5,
      :value => 1.5
    ))
  end

  it "renders new supply form" do
    render

    assert_select "form[action=?][method=?]", supplies_path, "post" do

      assert_select "input[name=?]", "supply[fuel]"

      assert_select "input[name=?]", "supply[fleet_id]"

      assert_select "input[name=?]", "supply[liters]"

      assert_select "input[name=?]", "supply[value]"
    end
  end
end
