require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :logradouro => "Logradouro",
        :numero => 2,
        :cep => "Cep",
        :bairro => "Bairro",
        :city => nil
      ),
      Address.create!(
        :logradouro => "Logradouro",
        :numero => 2,
        :cep => "Cep",
        :bairro => "Bairro",
        :city => nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => "Logradouro".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
