require 'rails_helper'

RSpec.describe "funcionarios/show", type: :view do
  before(:each) do
    @funcionario = assign(:funcionario, Funcionario.create!(
      :codigo => "",
      :nome => "Nome",
      :rg => "Rg",
      :usuario => "Usuario",
      :senha => "Senha",
      :sexo => "Sexo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Usuario/)
    expect(rendered).to match(/Senha/)
    expect(rendered).to match(/Sexo/)
  end
end
