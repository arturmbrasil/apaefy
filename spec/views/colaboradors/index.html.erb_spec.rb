require 'rails_helper'

RSpec.describe "colaboradors/index", type: :view do
  before(:each) do
    assign(:colaboradors, [
      Colaborador.create!(
        :codigo => 2,
        :nome => "Nome",
        :rg => "Rg",
        :cpf => "Cpf",
        :telefone => "Telefone",
        :sexo => "Sexo",
        :cnpj => "Cnpj",
        :inscricao_estadual => "Inscricao Estadual"
      ),
      Colaborador.create!(
        :codigo => 2,
        :nome => "Nome",
        :rg => "Rg",
        :cpf => "Cpf",
        :telefone => "Telefone",
        :sexo => "Sexo",
        :cnpj => "Cnpj",
        :inscricao_estadual => "Inscricao Estadual"
      )
    ])
  end

  it "renders a list of colaboradors" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Sexo".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Inscricao Estadual".to_s, :count => 2
  end
end
