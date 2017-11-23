require 'rails_helper'

RSpec.describe "student_evolutions/index", type: :view do
  before(:each) do
    assign(:student_evolutions, [
      StudentEvolution.create!(
        :student => nil,
        :description => "MyText"
      ),
      StudentEvolution.create!(
        :student => nil,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of student_evolutions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
