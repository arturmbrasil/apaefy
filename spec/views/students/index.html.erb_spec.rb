require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :nome => "Nome",
        :rg_aluno => "Rg Aluno",
        :cpf_aluno => "Cpf Aluno",
        :telefone => "Telefone",
        :sexo => "Sexo",
        :responsavel_curador => "Responsavel Curador",
        :restricoes_alimentares => "Restricoes Alimentares",
        :rg_responsavel => "Rg Responsavel",
        :cpf_responsavel => "Cpf Responsavel"
      ),
      Student.create!(
        :nome => "Nome",
        :rg_aluno => "Rg Aluno",
        :cpf_aluno => "Cpf Aluno",
        :telefone => "Telefone",
        :sexo => "Sexo",
        :responsavel_curador => "Responsavel Curador",
        :restricoes_alimentares => "Restricoes Alimentares",
        :rg_responsavel => "Rg Responsavel",
        :cpf_responsavel => "Cpf Responsavel"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Rg Aluno".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf Aluno".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Sexo".to_s, :count => 2
    assert_select "tr>td", :text => "Responsavel Curador".to_s, :count => 2
    assert_select "tr>td", :text => "Restricoes Alimentares".to_s, :count => 2
    assert_select "tr>td", :text => "Rg Responsavel".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf Responsavel".to_s, :count => 2
  end
end
