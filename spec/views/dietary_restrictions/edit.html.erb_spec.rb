require 'rails_helper'

RSpec.describe "dietary_restrictions/edit", type: :view do
  before(:each) do
    @dietary_restriction = assign(:dietary_restriction, DietaryRestriction.create!(
      :restriction => "MyString",
      :student => nil
    ))
  end

  it "renders the edit dietary_restriction form" do
    render

    assert_select "form[action=?][method=?]", dietary_restriction_path(@dietary_restriction), "post" do

      assert_select "input[name=?]", "dietary_restriction[restriction]"

      assert_select "input[name=?]", "dietary_restriction[student_id]"
    end
  end
end
