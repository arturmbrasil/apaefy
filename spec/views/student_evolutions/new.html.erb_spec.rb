require 'rails_helper'

RSpec.describe "student_evolutions/new", type: :view do
  before(:each) do
    assign(:student_evolution, StudentEvolution.new(
      :student => nil,
      :description => "MyText"
    ))
  end

  it "renders new student_evolution form" do
    render

    assert_select "form[action=?][method=?]", student_evolutions_path, "post" do

      assert_select "input[name=?]", "student_evolution[student_id]"

      assert_select "textarea[name=?]", "student_evolution[description]"
    end
  end
end
