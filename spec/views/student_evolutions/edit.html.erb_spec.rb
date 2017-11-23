require 'rails_helper'

RSpec.describe "student_evolutions/edit", type: :view do
  before(:each) do
    @student_evolution = assign(:student_evolution, StudentEvolution.create!(
      :student => nil,
      :description => "MyText"
    ))
  end

  it "renders the edit student_evolution form" do
    render

    assert_select "form[action=?][method=?]", student_evolution_path(@student_evolution), "post" do

      assert_select "input[name=?]", "student_evolution[student_id]"

      assert_select "textarea[name=?]", "student_evolution[description]"
    end
  end
end
