require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :nome => "MyString",
      :rg_aluno => "MyString",
      :cpf_aluno => "MyString",
      :telefone => "MyString",
      :sexo => "MyString",
      :responsavel_curador => "MyString",
      :restricoes_alimentares => "MyString",
      :rg_responsavel => "MyString",
      :cpf_responsavel => "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[nome]"

      assert_select "input[name=?]", "student[rg_aluno]"

      assert_select "input[name=?]", "student[cpf_aluno]"

      assert_select "input[name=?]", "student[telefone]"

      assert_select "input[name=?]", "student[sexo]"

      assert_select "input[name=?]", "student[responsavel_curador]"

      assert_select "input[name=?]", "student[restricoes_alimentares]"

      assert_select "input[name=?]", "student[rg_responsavel]"

      assert_select "input[name=?]", "student[cpf_responsavel]"
    end
  end
end
