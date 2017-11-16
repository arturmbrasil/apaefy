require 'rails_helper'

RSpec.describe "dietary_restrictions/new", type: :view do
  before(:each) do
    assign(:dietary_restriction, DietaryRestriction.new(
      :restriction => "MyString",
      :student => nil
    ))
  end

  it "renders new dietary_restriction form" do
    render

    assert_select "form[action=?][method=?]", dietary_restrictions_path, "post" do

      assert_select "input[name=?]", "dietary_restriction[restriction]"

      assert_select "input[name=?]", "dietary_restriction[student_id]"
    end
  end
end
