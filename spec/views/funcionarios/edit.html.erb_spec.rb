require 'rails_helper'

RSpec.describe "funcionarios/edit", type: :view do
  before(:each) do
    @funcionario = assign(:funcionario, Funcionario.create!(
      :codigo => 1,
      :nome => "MyString",
      :rg => "MyString",
      :cpf => "MyString",
      :sexo => "MyString",
      :data_admissao => "MyString",
      :ctps => "MyString",
      :cnh => 1,
      :cns => "MyString",
      :status => "MyString",
      :telefone => "MyString",
      :usuario => "MyString",
      :senha => "MyString",
      :setor => nil
    ))
  end

  it "renders the edit funcionario form" do
    render

    assert_select "form[action=?][method=?]", funcionario_path(@funcionario), "post" do

      assert_select "input[name=?]", "funcionario[codigo]"

      assert_select "input[name=?]", "funcionario[nome]"

      assert_select "input[name=?]", "funcionario[rg]"

      assert_select "input[name=?]", "funcionario[cpf]"

      assert_select "input[name=?]", "funcionario[sexo]"

      assert_select "input[name=?]", "funcionario[data_admissao]"

      assert_select "input[name=?]", "funcionario[ctps]"

      assert_select "input[name=?]", "funcionario[cnh]"

      assert_select "input[name=?]", "funcionario[cns]"

      assert_select "input[name=?]", "funcionario[status]"

      assert_select "input[name=?]", "funcionario[telefone]"

      assert_select "input[name=?]", "funcionario[usuario]"

      assert_select "input[name=?]", "funcionario[senha]"

      assert_select "input[name=?]", "funcionario[setor_id]"
    end
  end
end
