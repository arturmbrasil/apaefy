require 'rails_helper'

RSpec.describe "medicines/edit", type: :view do
  before(:each) do
    @medicine = assign(:medicine, Medicine.create!(
      :nome => "MyString",
      :dosagem => 1,
      :intervalo_tempo => 1,
      :student => nil
    ))
  end

  it "renders the edit medicine form" do
    render

    assert_select "form[action=?][method=?]", medicine_path(@medicine), "post" do

      assert_select "input[name=?]", "medicine[nome]"

      assert_select "input[name=?]", "medicine[dosagem]"

      assert_select "input[name=?]", "medicine[intervalo_tempo]"

      assert_select "input[name=?]", "medicine[student_id]"
    end
  end
end
