require 'rails_helper'

RSpec.describe "frotas/new", type: :view do
  before(:each) do
    assign(:frota, Frota.new(
      :nome => "MyString",
      :veiculo => "MyString",
      :placa => "MyString",
      :renavam => "MyString",
      :chassi => "MyString",
      :rota => "MyString",
      :motorista => "MyString",
      :roteirista => "MyString"
    ))
  end

  it "renders new frota form" do
    render

    assert_select "form[action=?][method=?]", frotas_path, "post" do

      assert_select "input[name=?]", "frota[nome]"

      assert_select "input[name=?]", "frota[veiculo]"

      assert_select "input[name=?]", "frota[placa]"

      assert_select "input[name=?]", "frota[renavam]"

      assert_select "input[name=?]", "frota[chassi]"

      assert_select "input[name=?]", "frota[rota]"

      assert_select "input[name=?]", "frota[motorista]"

      assert_select "input[name=?]", "frota[roteirista]"
    end
  end
end
