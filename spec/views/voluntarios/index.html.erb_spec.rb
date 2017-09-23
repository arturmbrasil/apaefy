require 'rails_helper'

RSpec.describe "voluntarios/index", type: :view do
  before(:each) do
    assign(:voluntarios, [
      Voluntario.create!(
        :codigo => 2,
        :nome => "Nome",
        :rg => "Rg",
        :cpf => "Cpf",
        :telefone => "Telefone",
        :usuario => "Usuario",
        :senha => "Senha",
        :sexo => ""
      ),
      Voluntario.create!(
        :codigo => 2,
        :nome => "Nome",
        :rg => "Rg",
        :cpf => "Cpf",
        :telefone => "Telefone",
        :usuario => "Usuario",
        :senha => "Senha",
        :sexo => ""
      )
    ])
  end

  it "renders a list of voluntarios" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Usuario".to_s, :count => 2
    assert_select "tr>td", :text => "Senha".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
