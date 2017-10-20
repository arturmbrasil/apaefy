require 'rails_helper'

RSpec.describe "conta_a_recebers/new", type: :view do
  before(:each) do
    assign(:conta_a_receber, ContaAReceber.new(
      :nome => "MyString",
      :valor => 1.5,
      :doacao => nil
    ))
  end

  it "renders new conta_a_receber form" do
    render

    assert_select "form[action=?][method=?]", conta_a_recebers_path, "post" do

      assert_select "input[name=?]", "conta_a_receber[nome]"

      assert_select "input[name=?]", "conta_a_receber[valor]"

      assert_select "input[name=?]", "conta_a_receber[doacao_id]"
    end
  end
end
