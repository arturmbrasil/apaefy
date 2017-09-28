require 'rails_helper'

RSpec.describe "frotas/index", type: :view do
  before(:each) do
    assign(:frotas, [
      Frota.create!(
        :nome => "Nome",
        :veiculo => "Veiculo",
        :placa => "Placa",
        :renavam => "Renavam",
        :chassi => "Chassi",
        :rota => "Rota",
        :motorista => "Motorista",
        :roteirista => "Roteirista"
      ),
      Frota.create!(
        :nome => "Nome",
        :veiculo => "Veiculo",
        :placa => "Placa",
        :renavam => "Renavam",
        :chassi => "Chassi",
        :rota => "Rota",
        :motorista => "Motorista",
        :roteirista => "Roteirista"
      )
    ])
  end

  it "renders a list of frotas" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Veiculo".to_s, :count => 2
    assert_select "tr>td", :text => "Placa".to_s, :count => 2
    assert_select "tr>td", :text => "Renavam".to_s, :count => 2
    assert_select "tr>td", :text => "Chassi".to_s, :count => 2
    assert_select "tr>td", :text => "Rota".to_s, :count => 2
    assert_select "tr>td", :text => "Motorista".to_s, :count => 2
    assert_select "tr>td", :text => "Roteirista".to_s, :count => 2
  end
end
