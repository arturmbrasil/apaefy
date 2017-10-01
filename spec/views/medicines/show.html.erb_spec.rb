require 'rails_helper'

RSpec.describe "medicines/show", type: :view do
  before(:each) do
    @medicine = assign(:medicine, Medicine.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
