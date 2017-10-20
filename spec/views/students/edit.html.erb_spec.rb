require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
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

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

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
