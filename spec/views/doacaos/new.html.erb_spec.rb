require 'rails_helper'

RSpec.describe "doacaos/new", type: :view do
  before(:each) do
    assign(:doacao, Doacao.new(
      :valor => 1.5,
      :forma_pagamento => "MyString",
      :parceiro => nil
    ))
  end

  it "renders new doacao form" do
    render

    assert_select "form[action=?][method=?]", doacaos_path, "post" do

      assert_select "input[name=?]", "doacao[valor]"

      assert_select "input[name=?]", "doacao[forma_pagamento]"

      assert_select "input[name=?]", "doacao[parceiro_id]"
    end
  end
end
