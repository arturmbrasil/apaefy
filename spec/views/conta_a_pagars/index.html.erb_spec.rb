require 'rails_helper'

RSpec.describe "conta_a_pagars/index", type: :view do
  before(:each) do
    assign(:conta_a_pagars, [
      ContaAPagar.create!(
        :nome => "Nome",
        :nr_nota => 2,
        :valor => 3.5
      ),
      ContaAPagar.create!(
        :nome => "Nome",
        :nr_nota => 2,
        :valor => 3.5
      )
    ])
  end

  it "renders a list of conta_a_pagars" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
