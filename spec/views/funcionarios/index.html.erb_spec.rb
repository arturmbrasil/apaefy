require 'rails_helper'

RSpec.describe "funcionarios/index", type: :view do
  before(:each) do
    assign(:funcionarios, [
      Funcionario.create!(
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
      ),
      Funcionario.create!(
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
      )
    ])
  end

  it "renders a list of funcionarios" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Sexo".to_s, :count => 2
    assert_select "tr>td", :text => "Data Admissao".to_s, :count => 2
    assert_select "tr>td", :text => "Ctps".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Cns".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Usuario".to_s, :count => 2
    assert_select "tr>td", :text => "Senha".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
