require 'rails_helper'

RSpec.describe "fornecedors/show", type: :view do
  before(:each) do
    @fornecedor = assign(:fornecedor, Fornecedor.create!(
      :codigo => 2,
      :nome => "Nome",
      :telefone => "Telefone",
      :cnpj => "Cnpj",
      :inscricao_estadual => "Inscricao Estadual"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Cnpj/)
    expect(rendered).to match(/Inscricao Estadual/)
  end
end
