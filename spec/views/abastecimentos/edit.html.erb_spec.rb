require 'rails_helper'

RSpec.describe "abastecimentos/edit", type: :view do
  before(:each) do
    @abastecimento = assign(:abastecimento, Abastecimento.create!(
      :combustivel => "MyString",
      :frota => nil,
      :litros => 1.5,
      :valor => 1.5
    ))
  end

  it "renders the edit abastecimento form" do
    render

    assert_select "form[action=?][method=?]", abastecimento_path(@abastecimento), "post" do

      assert_select "input[name=?]", "abastecimento[combustivel]"

      assert_select "input[name=?]", "abastecimento[frota_id]"

      assert_select "input[name=?]", "abastecimento[litros]"

      assert_select "input[name=?]", "abastecimento[valor]"
    end
  end
end
