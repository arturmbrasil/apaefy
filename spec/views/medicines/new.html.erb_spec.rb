require 'rails_helper'

RSpec.describe "medicines/new", type: :view do
  before(:each) do
    assign(:medicine, Medicine.new(
      :nome => "MyString",
      :dosagem => 1,
      :intervalo_tempo => 1,
      :student => nil
    ))
  end

  it "renders new medicine form" do
    render

    assert_select "form[action=?][method=?]", medicines_path, "post" do

      assert_select "input[name=?]", "medicine[nome]"

      assert_select "input[name=?]", "medicine[dosagem]"

      assert_select "input[name=?]", "medicine[intervalo_tempo]"

      assert_select "input[name=?]", "medicine[student_id]"
    end
  end
end
