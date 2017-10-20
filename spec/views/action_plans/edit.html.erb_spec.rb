require 'rails_helper'

RSpec.describe "action_plans/edit", type: :view do
  before(:each) do
    @action_plan = assign(:action_plan, ActionPlan.create!(
      :data => "MyString",
      :evolucao => "MyString",
      :student => nil
    ))
  end

  it "renders the edit action_plan form" do
    render

    assert_select "form[action=?][method=?]", action_plan_path(@action_plan), "post" do

      assert_select "input[name=?]", "action_plan[data]"

      assert_select "input[name=?]", "action_plan[evolucao]"

      assert_select "input[name=?]", "action_plan[student_id]"
    end
  end
end
