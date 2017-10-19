require 'rails_helper'

RSpec.describe "abastecimentos/new", type: :view do
  before(:each) do
    assign(:abastecimento, Abastecimento.new(
      :combustivel => "MyString",
      :frota => nil,
      :litros => 1.5,
      :valor => 1.5
    ))
  end

  it "renders new abastecimento form" do
    render

    assert_select "form[action=?][method=?]", abastecimentos_path, "post" do

      assert_select "input[name=?]", "abastecimento[combustivel]"

      assert_select "input[name=?]", "abastecimento[frota_id]"

      assert_select "input[name=?]", "abastecimento[litros]"

      assert_select "input[name=?]", "abastecimento[valor]"
    end
  end
end
