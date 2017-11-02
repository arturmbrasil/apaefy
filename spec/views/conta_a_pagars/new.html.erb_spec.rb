require 'rails_helper'

RSpec.describe "conta_a_pagars/new", type: :view do
  before(:each) do
    assign(:conta_a_pagar, ContaAPagar.new(
      :nome => "MyString",
      :nr_nota => 1,
      :valor => 1.5
    ))
  end

  it "renders new conta_a_pagar form" do
    render

    assert_select "form[action=?][method=?]", conta_a_pagars_path, "post" do

      assert_select "input[name=?]", "conta_a_pagar[nome]"

      assert_select "input[name=?]", "conta_a_pagar[nr_nota]"

      assert_select "input[name=?]", "conta_a_pagar[valor]"
    end
  end
end
