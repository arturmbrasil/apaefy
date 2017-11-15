require 'rails_helper'

RSpec.describe "supplies/show", type: :view do
  before(:each) do
    @supply = assign(:supply, Supply.create!(
      :fuel => "Fuel",
      :fleet => nil,
      :liters => 2.5,
      :value => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fuel/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
