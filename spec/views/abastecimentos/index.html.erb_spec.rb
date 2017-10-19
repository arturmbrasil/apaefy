require 'rails_helper'

RSpec.describe "abastecimentos/index", type: :view do
  before(:each) do
    assign(:abastecimentos, [
      Abastecimento.create!(
        :combustivel => "Combustivel",
        :frota => nil,
        :litros => 2.5,
        :valor => 3.5
      ),
      Abastecimento.create!(
        :combustivel => "Combustivel",
        :frota => nil,
        :litros => 2.5,
        :valor => 3.5
      )
    ])
  end

  it "renders a list of abastecimentos" do
    render
    assert_select "tr>td", :text => "Combustivel".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
