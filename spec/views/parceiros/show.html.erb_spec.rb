require 'rails_helper'

RSpec.describe "parceiros/show", type: :view do
  before(:each) do
    @parceiro = assign(:parceiro, Parceiro.create!(
      :nome => "Nome",
      :telefome => "Telefome",
      :cnpj => "Cnpj",
      :inscricao_estatual => "Inscricao Estatual"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Telefome/)
    expect(rendered).to match(/Cnpj/)
    expect(rendered).to match(/Inscricao Estatual/)
  end
end
