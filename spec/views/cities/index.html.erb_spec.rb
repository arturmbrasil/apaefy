require 'rails_helper'

RSpec.describe "cities/index", type: :view do
  before(:each) do
    assign(:cities, [
      City.create!(
        :nome => "Nome",
        :uf => "Uf"
      ),
      City.create!(
        :nome => "Nome",
        :uf => "Uf"
      )
    ])
  end

  it "renders a list of cities" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Uf".to_s, :count => 2
  end
end
