require 'rails_helper'

RSpec.describe "projetos/new", type: :view do
  before(:each) do
    assign(:projeto, Projeto.new(
      :codigo => 1,
      :titulo => "MyString",
      :descricao => "MyString",
      :status => "MyString",
      :metas => "MyString",
      :valor => 1.5
    ))
  end

  it "renders new projeto form" do
    render

    assert_select "form[action=?][method=?]", projetos_path, "post" do

      assert_select "input[name=?]", "projeto[codigo]"

      assert_select "input[name=?]", "projeto[titulo]"

      assert_select "input[name=?]", "projeto[descricao]"

      assert_select "input[name=?]", "projeto[status]"

      assert_select "input[name=?]", "projeto[metas]"

      assert_select "input[name=?]", "projeto[valor]"
    end
  end
end
