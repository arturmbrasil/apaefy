require 'rails_helper'

RSpec.describe "action_plans/new", type: :view do
  before(:each) do
    assign(:action_plan, ActionPlan.new(
      :frequencia => "MyString",
      :evolucao => "MyString",
      :student => nil
    ))
  end

  it "renders new action_plan form" do
    render

    assert_select "form[action=?][method=?]", action_plans_path, "post" do

      assert_select "input[name=?]", "action_plan[frequencia]"

      assert_select "input[name=?]", "action_plan[evolucao]"

      assert_select "input[name=?]", "action_plan[student_id]"
    end
  end
end
