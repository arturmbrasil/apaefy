require 'rails_helper'

RSpec.describe "dietary_restrictions/index", type: :view do
  before(:each) do
    assign(:dietary_restrictions, [
      DietaryRestriction.create!(
        :restriction => "Restriction",
        :student => nil
      ),
      DietaryRestriction.create!(
        :restriction => "Restriction",
        :student => nil
      )
    ])
  end

  it "renders a list of dietary_restrictions" do
    render
    assert_select "tr>td", :text => "Restriction".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
