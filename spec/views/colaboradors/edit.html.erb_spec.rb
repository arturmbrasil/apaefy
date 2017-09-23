require 'rails_helper'

RSpec.describe "colaboradors/edit", type: :view do
  before(:each) do
    @colaborador = assign(:colaborador, Colaborador.create!(
      :codigo => 1,
      :nome => "MyString",
      :rg => "MyString",
      :cpf => "MyString",
      :telefone => "MyString",
      :sexo => "MyString",
      :cnpj => "MyString",
      :inscricao_estadual => "MyString"
    ))
  end

  it "renders the edit colaborador form" do
    render

    assert_select "form[action=?][method=?]", colaborador_path(@colaborador), "post" do

      assert_select "input[name=?]", "colaborador[codigo]"

      assert_select "input[name=?]", "colaborador[nome]"

      assert_select "input[name=?]", "colaborador[rg]"

      assert_select "input[name=?]", "colaborador[cpf]"

      assert_select "input[name=?]", "colaborador[telefone]"

      assert_select "input[name=?]", "colaborador[sexo]"

      assert_select "input[name=?]", "colaborador[cnpj]"

      assert_select "input[name=?]", "colaborador[inscricao_estadual]"
    end
  end
end
