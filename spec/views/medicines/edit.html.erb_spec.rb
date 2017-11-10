require 'rails_helper'

RSpec.describe "medicines/edit", type: :view do
  before(:each) do
    @medicine = assign(:medicine, Medicine.create!(
      :name => "MyString",
      :dosage => "MyString",
      :time_interval => "MyString",
      :student => nil
    ))
  end

  it "renders the edit medicine form" do
    render

    assert_select "form[action=?][method=?]", medicine_path(@medicine), "post" do

      assert_select "input[name=?]", "medicine[name]"

      assert_select "input[name=?]", "medicine[dosage]"

      assert_select "input[name=?]", "medicine[time_interval]"

      assert_select "input[name=?]", "medicine[student_id]"
    end
  end
end
