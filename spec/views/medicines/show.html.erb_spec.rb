require 'rails_helper'

RSpec.describe "medicines/show", type: :view do
  before(:each) do
    @medicine = assign(:medicine, Medicine.create!(
      :nome => "Nome",
      :dosagem => 2,
      :intervalo_tempo => 3,
      :student => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
