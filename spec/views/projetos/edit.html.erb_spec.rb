require 'rails_helper'

RSpec.describe "projetos/edit", type: :view do
  before(:each) do
    @projeto = assign(:projeto, Projeto.create!(
      :codigo => 1,
      :titulo => "MyString",
      :descricao => "MyString",
      :status => "MyString",
      :metas => "MyString",
      :valor => 1.5
    ))
  end

  it "renders the edit projeto form" do
    render

    assert_select "form[action=?][method=?]", projeto_path(@projeto), "post" do

      assert_select "input[name=?]", "projeto[codigo]"

      assert_select "input[name=?]", "projeto[titulo]"

      assert_select "input[name=?]", "projeto[descricao]"

      assert_select "input[name=?]", "projeto[status]"

      assert_select "input[name=?]", "projeto[metas]"

      assert_select "input[name=?]", "projeto[valor]"
    end
  end
end
