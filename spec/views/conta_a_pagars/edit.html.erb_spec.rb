require 'rails_helper'

RSpec.describe "conta_a_pagars/edit", type: :view do
  before(:each) do
    @conta_a_pagar = assign(:conta_a_pagar, ContaAPagar.create!(
      :nome => "MyString",
      :nr_nota => 1,
      :valor => 1.5
    ))
  end

  it "renders the edit conta_a_pagar form" do
    render

    assert_select "form[action=?][method=?]", conta_a_pagar_path(@conta_a_pagar), "post" do

      assert_select "input[name=?]", "conta_a_pagar[nome]"

      assert_select "input[name=?]", "conta_a_pagar[nr_nota]"

      assert_select "input[name=?]", "conta_a_pagar[valor]"
    end
  end
end
