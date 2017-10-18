require 'rails_helper'

RSpec.describe "parceiros/new", type: :view do
  before(:each) do
    assign(:parceiro, Parceiro.new(
      :nome => "MyString",
      :telefome => "MyString",
      :cnpj => "MyString",
      :inscricao_estatual => "MyString"
    ))
  end

  it "renders new parceiro form" do
    render

    assert_select "form[action=?][method=?]", parceiros_path, "post" do

      assert_select "input[name=?]", "parceiro[nome]"

      assert_select "input[name=?]", "parceiro[telefome]"

      assert_select "input[name=?]", "parceiro[cnpj]"

      assert_select "input[name=?]", "parceiro[inscricao_estatual]"
    end
  end
end
