require 'rails_helper'

RSpec.describe "parceiros/edit", type: :view do
  before(:each) do
    @parceiro = assign(:parceiro, Parceiro.create!(
      :nome => "MyString",
      :telefome => "MyString",
      :cnpj => "MyString",
      :inscricao_estatual => "MyString"
    ))
  end

  it "renders the edit parceiro form" do
    render

    assert_select "form[action=?][method=?]", parceiro_path(@parceiro), "post" do

      assert_select "input[name=?]", "parceiro[nome]"

      assert_select "input[name=?]", "parceiro[telefome]"

      assert_select "input[name=?]", "parceiro[cnpj]"

      assert_select "input[name=?]", "parceiro[inscricao_estatual]"
    end
  end
end
