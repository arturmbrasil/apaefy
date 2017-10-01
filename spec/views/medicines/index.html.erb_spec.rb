require 'rails_helper'

RSpec.describe "medicines/index", type: :view do
  before(:each) do
    assign(:medicines, [
      Medicine.create!(
        :nome => "Nome"
      ),
      Medicine.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of medicines" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
