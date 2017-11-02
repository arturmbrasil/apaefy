require 'rails_helper'

RSpec.describe "fornecedors/index", type: :view do
  before(:each) do
    assign(:fornecedors, [
      Fornecedor.create!(
        :codigo => 2,
        :nome => "Nome",
        :telefone => "Telefone",
        :cnpj => "Cnpj",
        :inscricao_estadual => "Inscricao Estadual"
      ),
      Fornecedor.create!(
        :codigo => 2,
        :nome => "Nome",
        :telefone => "Telefone",
        :cnpj => "Cnpj",
        :inscricao_estadual => "Inscricao Estadual"
      )
    ])
  end

  it "renders a list of fornecedors" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Inscricao Estadual".to_s, :count => 2
  end
end
