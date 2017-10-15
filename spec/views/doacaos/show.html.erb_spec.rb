require 'rails_helper'

RSpec.describe "doacaos/show", type: :view do
  before(:each) do
    @doacao = assign(:doacao, Doacao.create!(
      :valor => 2.5,
      :forma_pagamento => "Forma Pagamento",
      :parceiro => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Forma Pagamento/)
    expect(rendered).to match(//)
  end
end
