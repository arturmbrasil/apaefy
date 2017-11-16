require 'rails_helper'

RSpec.describe "account_pays/index", type: :view do
  before(:each) do
    assign(:account_pays, [
      AccountPay.create!(
        :name => "Name",
        :nr_nota => 2,
        :value => "9.99"
      ),
      AccountPay.create!(
        :name => "Name",
        :nr_nota => 2,
        :value => "9.99"
      )
    ])
  end

  it "renders a list of account_pays" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
