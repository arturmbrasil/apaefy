require 'rails_helper'

RSpec.describe "funcionarios/new", type: :view do
  before(:each) do
    assign(:funcionario, Funcionario.new(
      :codigo => "",
      :nome => "MyString",
      :rg => "MyString",
      :usuario => "MyString",
      :senha => "MyString",
      :sexo => "MyString"
    ))
  end

  it "renders new funcionario form" do
    render

    assert_select "form[action=?][method=?]", funcionarios_path, "post" do

      assert_select "input[name=?]", "funcionario[codigo]"

      assert_select "input[name=?]", "funcionario[nome]"

      assert_select "input[name=?]", "funcionario[rg]"

      assert_select "input[name=?]", "funcionario[usuario]"

      assert_select "input[name=?]", "funcionario[senha]"

      assert_select "input[name=?]", "funcionario[sexo]"
    end
  end
end
