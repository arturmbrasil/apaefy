require 'rails_helper'

RSpec.describe "conta_a_pagars/show", type: :view do
  before(:each) do
    @conta_a_pagar = assign(:conta_a_pagar, ContaAPagar.create!(
      :nome => "Nome",
      :nr_nota => 2,
      :valor => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
  end
end
