require 'rails_helper'

RSpec.describe "medicines/index", type: :view do
  before(:each) do
    assign(:medicines, [
      Medicine.create!(
        :name => "Name",
        :dosage => "Dosage",
        :time_interval => "Time Interval",
        :student => nil
      ),
      Medicine.create!(
        :name => "Name",
        :dosage => "Dosage",
        :time_interval => "Time Interval",
        :student => nil
      )
    ])
  end

  it "renders a list of medicines" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Dosage".to_s, :count => 2
    assert_select "tr>td", :text => "Time Interval".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
