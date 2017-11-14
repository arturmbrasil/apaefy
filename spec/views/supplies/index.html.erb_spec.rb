require 'rails_helper'

RSpec.describe "supplies/index", type: :view do
  before(:each) do
    assign(:supplies, [
      Supply.create!(
        :fuel => "Fuel",
        :fleet => nil,
        :liters => 2.5,
        :value => 3.5
      ),
      Supply.create!(
        :fuel => "Fuel",
        :fleet => nil,
        :liters => 2.5,
        :value => 3.5
      )
    ])
  end

  it "renders a list of supplies" do
    render
    assert_select "tr>td", :text => "Fuel".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
