require 'rails_helper'

RSpec.describe "funcionarios/edit", type: :view do
  before(:each) do
    @funcionario = assign(:funcionario, Funcionario.create!(
      :codigo => "",
      :nome => "MyString",
      :rg => "MyString",
      :usuario => "MyString",
      :senha => "MyString",
      :sexo => "MyString"
    ))
  end

  it "renders the edit funcionario form" do
    render

    assert_select "form[action=?][method=?]", funcionario_path(@funcionario), "post" do

      assert_select "input[name=?]", "funcionario[codigo]"

      assert_select "input[name=?]", "funcionario[nome]"

      assert_select "input[name=?]", "funcionario[rg]"

      assert_select "input[name=?]", "funcionario[usuario]"

      assert_select "input[name=?]", "funcionario[senha]"

      assert_select "input[name=?]", "funcionario[sexo]"
    end
  end
end
