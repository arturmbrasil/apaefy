require 'rails_helper'

RSpec.describe "conta_a_recebers/show", type: :view do
  before(:each) do
    @conta_a_receber = assign(:conta_a_receber, ContaAReceber.create!(
      :nome => "Nome",
      :valor => 2.5,
      :doacao => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
  end
end
