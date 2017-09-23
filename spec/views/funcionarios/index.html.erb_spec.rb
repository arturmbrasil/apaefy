require 'rails_helper'

RSpec.describe "funcionarios/index", type: :view do
  before(:each) do
    assign(:funcionarios, [
      Funcionario.create!(
        :codigo => "",
        :nome => "Nome",
        :rg => "Rg",
        :usuario => "Usuario",
        :senha => "Senha",
        :sexo => "Sexo"
      ),
      Funcionario.create!(
        :codigo => "",
        :nome => "Nome",
        :rg => "Rg",
        :usuario => "Usuario",
        :senha => "Senha",
        :sexo => "Sexo"
      )
    ])
  end

  it "renders a list of funcionarios" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Usuario".to_s, :count => 2
    assert_select "tr>td", :text => "Senha".to_s, :count => 2
    assert_select "tr>td", :text => "Sexo".to_s, :count => 2
  end
end
