require 'rails_helper'

RSpec.describe "funcionarios/show", type: :view do
  before(:each) do
    @funcionario = assign(:funcionario, Funcionario.create!(
      :codigo => 2,
      :nome => "Nome",
      :rg => "Rg",
      :cpf => "Cpf",
      :sexo => "Sexo",
      :data_admissao => "Data Admissao",
      :ctps => "Ctps",
      :cnh => 3,
      :cns => "Cns",
      :status => "Status",
      :telefone => "Telefone",
      :usuario => "Usuario",
      :senha => "Senha",
      :setor => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Sexo/)
    expect(rendered).to match(/Data Admissao/)
    expect(rendered).to match(/Ctps/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Cns/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Usuario/)
    expect(rendered).to match(/Senha/)
    expect(rendered).to match(//)
  end
end
