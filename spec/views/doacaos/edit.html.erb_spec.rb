require 'rails_helper'

RSpec.describe "doacaos/edit", type: :view do
  before(:each) do
    @doacao = assign(:doacao, Doacao.create!(
      :valor => 1.5,
      :forma_pagamento => "MyString",
      :parceiro => nil
    ))
  end

  it "renders the edit doacao form" do
    render

    assert_select "form[action=?][method=?]", doacao_path(@doacao), "post" do

      assert_select "input[name=?]", "doacao[valor]"

      assert_select "input[name=?]", "doacao[forma_pagamento]"

      assert_select "input[name=?]", "doacao[parceiro_id]"
    end
  end
end
