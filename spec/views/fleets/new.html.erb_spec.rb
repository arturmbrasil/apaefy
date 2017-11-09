require 'rails_helper'

RSpec.describe "fleets/new", type: :view do
  before(:each) do
    assign(:fleet, Fleet.new(
      :name => "MyString",
      :vehicle => "MyString",
      :license_plate => "MyString",
      :document_renavam => "MyString",
      :chassis => "MyString",
      :route => "MyString",
      :driver_name => "MyString",
      :router => "MyString"
    ))
  end

  it "renders new fleet form" do
    render

    assert_select "form[action=?][method=?]", fleets_path, "post" do

      assert_select "input[name=?]", "fleet[name]"

      assert_select "input[name=?]", "fleet[vehicle]"

      assert_select "input[name=?]", "fleet[license_plate]"

      assert_select "input[name=?]", "fleet[document_renavam]"

      assert_select "input[name=?]", "fleet[chassis]"

      assert_select "input[name=?]", "fleet[route]"

      assert_select "input[name=?]", "fleet[driver_name]"

      assert_select "input[name=?]", "fleet[router]"
    end
  end
end
