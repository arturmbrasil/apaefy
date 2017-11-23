require 'rails_helper'

RSpec.describe "student_evolutions/show", type: :view do
  before(:each) do
    @student_evolution = assign(:student_evolution, StudentEvolution.create!(
      :student => nil,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
