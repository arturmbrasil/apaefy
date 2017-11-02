require 'rails_helper'

RSpec.describe "projetos/index", type: :view do
  before(:each) do
    assign(:projetos, [
      Projeto.create!(
        :codigo => 2,
        :titulo => "Titulo",
        :descricao => "Descricao",
        :status => "Status",
        :metas => "Metas",
        :valor => 3.5
      ),
      Projeto.create!(
        :codigo => 2,
        :titulo => "Titulo",
        :descricao => "Descricao",
        :status => "Status",
        :metas => "Metas",
        :valor => 3.5
      )
    ])
  end

  it "renders a list of projetos" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Metas".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
