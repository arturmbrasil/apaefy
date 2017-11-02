require 'rails_helper'

RSpec.describe "fornecedors/edit", type: :view do
  before(:each) do
    @fornecedor = assign(:fornecedor, Fornecedor.create!(
      :codigo => 1,
      :nome => "MyString",
      :telefone => "MyString",
      :cnpj => "MyString",
      :inscricao_estadual => "MyString"
    ))
  end

  it "renders the edit fornecedor form" do
    render

    assert_select "form[action=?][method=?]", fornecedor_path(@fornecedor), "post" do

      assert_select "input[name=?]", "fornecedor[codigo]"

      assert_select "input[name=?]", "fornecedor[nome]"

      assert_select "input[name=?]", "fornecedor[telefone]"

      assert_select "input[name=?]", "fornecedor[cnpj]"

      assert_select "input[name=?]", "fornecedor[inscricao_estadual]"
    end
  end
end
