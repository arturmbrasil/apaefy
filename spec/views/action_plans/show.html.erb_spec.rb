require 'rails_helper'

RSpec.describe "action_plans/show", type: :view do
  before(:each) do
    @action_plan = assign(:action_plan, ActionPlan.create!(
      :data => "data",
      :evolucao => "Evolucao",
      :student => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/data/)
    expect(rendered).to match(/Evolucao/)
    expect(rendered).to match(//)
  end
end
