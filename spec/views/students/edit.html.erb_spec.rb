require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :name => "MyString",
      :document_rg => "MyString",
      :document_cpf => "MyString",
      :phone_numbers => "MyString",
      :gender => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input[name=?]", "student[name]"

      assert_select "input[name=?]", "student[document_rg]"

      assert_select "input[name=?]", "student[document_cpf]"

      assert_select "input[name=?]", "student[phone_numbers]"

      assert_select "input[name=?]", "student[gender]"
    end
  end
end
