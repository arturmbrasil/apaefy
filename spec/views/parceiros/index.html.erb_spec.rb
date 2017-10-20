require 'rails_helper'

RSpec.describe "parceiros/index", type: :view do
  before(:each) do
    assign(:parceiros, [
      Parceiro.create!(
        :nome => "Nome",
        :telefome => "Telefome",
        :cnpj => "Cnpj",
        :inscricao_estatual => "Inscricao Estatual"
      ),
      Parceiro.create!(
        :nome => "Nome",
        :telefome => "Telefome",
        :cnpj => "Cnpj",
        :inscricao_estatual => "Inscricao Estatual"
      )
    ])
  end

  it "renders a list of parceiros" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Telefome".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Inscricao Estatual".to_s, :count => 2
  end
end
