require 'rails_helper'

RSpec.describe "voluntarios/show", type: :view do
  before(:each) do
    @voluntario = assign(:voluntario, Voluntario.create!(
      :codigo => 2,
      :nome => "Nome",
      :rg => "Rg",
      :cpf => "Cpf",
      :telefone => "Telefone",
      :usuario => "Usuario",
      :senha => "Senha",
      :sexo => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Usuario/)
    expect(rendered).to match(/Senha/)
    expect(rendered).to match(//)
  end
end
