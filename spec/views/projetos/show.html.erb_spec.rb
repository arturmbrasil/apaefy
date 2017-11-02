require 'rails_helper'

RSpec.describe "projetos/show", type: :view do
  before(:each) do
    @projeto = assign(:projeto, Projeto.create!(
      :codigo => 2,
      :titulo => "Titulo",
      :descricao => "Descricao",
      :status => "Status",
      :metas => "Metas",
      :valor => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Metas/)
    expect(rendered).to match(/3.5/)
  end
end
