require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :name => "MyString",
      :document_rg => "MyString",
      :document_cpf => "MyString",
      :phone_numbers => "MyString",
      :gender => "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[name]"

      assert_select "input[name=?]", "student[document_rg]"

      assert_select "input[name=?]", "student[document_cpf]"

      assert_select "input[name=?]", "student[phone_numbers]"

      assert_select "input[name=?]", "student[gender]"
    end
  end
end
