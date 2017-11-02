require 'rails_helper'

RSpec.describe "colaboradors/show", type: :view do
  before(:each) do
    @colaborador = assign(:colaborador, Colaborador.create!(
      :codigo => 2,
      :nome => "Nome",
      :rg => "Rg",
      :cpf => "Cpf",
      :telefone => "Telefone",
      :sexo => "Sexo",
      :cnpj => "Cnpj",
      :inscricao_estadual => "Inscricao Estadual"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Sexo/)
    expect(rendered).to match(/Cnpj/)
    expect(rendered).to match(/Inscricao Estadual/)
  end
end
