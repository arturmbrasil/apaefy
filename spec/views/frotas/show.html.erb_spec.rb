require 'rails_helper'

RSpec.describe "frotas/show", type: :view do
  before(:each) do
    @frota = assign(:frota, Frota.create!(
      :nome => "Nome",
      :veiculo => "Veiculo",
      :placa => "Placa",
      :renavam => "Renavam",
      :chassi => "Chassi",
      :rota => "Rota",
      :motorista => "Motorista",
      :roteirista => "Roteirista"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Veiculo/)
    expect(rendered).to match(/Placa/)
    expect(rendered).to match(/Renavam/)
    expect(rendered).to match(/Chassi/)
    expect(rendered).to match(/Rota/)
    expect(rendered).to match(/Motorista/)
    expect(rendered).to match(/Roteirista/)
  end
end
