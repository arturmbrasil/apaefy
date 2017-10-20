require 'rails_helper'

RSpec.describe "action_plans/index", type: :view do
  before(:each) do
    assign(:action_plans, [
      ActionPlan.create!(
        :data => "data",
        :evolucao => "Evolucao",
        :student => nil
      ),
      ActionPlan.create!(
        :data => "data",
        :evolucao => "Evolucao",
        :student => nil
      )
    ])
  end

  it "renders a list of action_plans" do
    render
    assert_select "tr>td", :text => "data".to_s, :count => 2
    assert_select "tr>td", :text => "Evolucao".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
