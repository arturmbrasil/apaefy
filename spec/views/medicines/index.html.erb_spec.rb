require 'rails_helper'

RSpec.describe "medicines/index", type: :view do
  before(:each) do
    assign(:medicines, [
      Medicine.create!(
        :nome => "Nome",
        :dosagem => 2,
        :intervalo_tempo => 3,
        :student => nil
      ),
      Medicine.create!(
        :nome => "Nome",
        :dosagem => 2,
        :intervalo_tempo => 3,
        :student => nil
      )
    ])
  end

  it "renders a list of medicines" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
