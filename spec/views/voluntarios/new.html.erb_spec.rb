require 'rails_helper'

RSpec.describe "voluntarios/new", type: :view do
  before(:each) do
    assign(:voluntario, Voluntario.new(
      :codigo => 1,
      :nome => "MyString",
      :rg => "MyString",
      :cpf => "MyString",
      :telefone => "MyString",
      :usuario => "MyString",
      :senha => "MyString",
      :sexo => ""
    ))
  end

  it "renders new voluntario form" do
    render

    assert_select "form[action=?][method=?]", voluntarios_path, "post" do

      assert_select "input[name=?]", "voluntario[codigo]"

      assert_select "input[name=?]", "voluntario[nome]"

      assert_select "input[name=?]", "voluntario[rg]"

      assert_select "input[name=?]", "voluntario[cpf]"

      assert_select "input[name=?]", "voluntario[telefone]"

      assert_select "input[name=?]", "voluntario[usuario]"

      assert_select "input[name=?]", "voluntario[senha]"

      assert_select "input[name=?]", "voluntario[sexo]"
    end
  end
end
