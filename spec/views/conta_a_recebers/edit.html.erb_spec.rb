require 'rails_helper'

RSpec.describe "conta_a_recebers/edit", type: :view do
  before(:each) do
    @conta_a_receber = assign(:conta_a_receber, ContaAReceber.create!(
      :nome => "MyString",
      :valor => 1.5,
      :doacao => nil
    ))
  end

  it "renders the edit conta_a_receber form" do
    render

    assert_select "form[action=?][method=?]", conta_a_receber_path(@conta_a_receber), "post" do

      assert_select "input[name=?]", "conta_a_receber[nome]"

      assert_select "input[name=?]", "conta_a_receber[valor]"

      assert_select "input[name=?]", "conta_a_receber[doacao_id]"
    end
  end
end
