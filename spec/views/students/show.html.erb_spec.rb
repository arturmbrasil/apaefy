require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :nome => "Nome",
      :rg_aluno => "Rg Aluno",
      :cpf_aluno => "Cpf Aluno",
      :telefone => "Telefone",
      :sexo => "Sexo",
      :responsavel_curador => "Responsavel Curador",
      :restricoes_alimentares => "Restricoes Alimentares",
      :rg_responsavel => "Rg Responsavel",
      :cpf_responsavel => "Cpf Responsavel"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Rg Aluno/)
    expect(rendered).to match(/Cpf Aluno/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Sexo/)
    expect(rendered).to match(/Responsavel Curador/)
    expect(rendered).to match(/Restricoes Alimentares/)
    expect(rendered).to match(/Rg Responsavel/)
    expect(rendered).to match(/Cpf Responsavel/)
  end
end
