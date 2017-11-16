require 'rails_helper'

RSpec.describe "student_responsibles/edit", type: :view do
  before(:each) do
    @student_responsible = assign(:student_responsible, StudentResponsible.create!(
      :name => "MyString",
      :phone_number => "MyString",
      :responsible_rg => "MyString",
      :responsible_cpf => "MyString",
      :gender => "MyString",
      :student => nil
    ))
  end

  it "renders the edit student_responsible form" do
    render

    assert_select "form[action=?][method=?]", student_responsible_path(@student_responsible), "post" do

      assert_select "input[name=?]", "student_responsible[name]"

      assert_select "input[name=?]", "student_responsible[phone_number]"

      assert_select "input[name=?]", "student_responsible[responsible_rg]"

      assert_select "input[name=?]", "student_responsible[responsible_cpf]"

      assert_select "input[name=?]", "student_responsible[gender]"

      assert_select "input[name=?]", "student_responsible[student_id]"
    end
  end
end
