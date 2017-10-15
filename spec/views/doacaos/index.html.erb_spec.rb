require 'rails_helper'

RSpec.describe "doacaos/index", type: :view do
  before(:each) do
    assign(:doacaos, [
      Doacao.create!(
        :valor => 2.5,
        :forma_pagamento => "Forma Pagamento",
        :parceiro => nil
      ),
      Doacao.create!(
        :valor => 2.5,
        :forma_pagamento => "Forma Pagamento",
        :parceiro => nil
      )
    ])
  end

  it "renders a list of doacaos" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Forma Pagamento".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
