require 'rails_helper'

RSpec.describe "conta_a_recebers/index", type: :view do
  before(:each) do
    assign(:conta_a_recebers, [
      ContaAReceber.create!(
        :nome => "Nome",
        :valor => 2.5,
        :doacao => nil
      ),
      ContaAReceber.create!(
        :nome => "Nome",
        :valor => 2.5,
        :doacao => nil
      )
    ])
  end

  it "renders a list of conta_a_recebers" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
