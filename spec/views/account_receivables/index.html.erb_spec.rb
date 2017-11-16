require 'rails_helper'

RSpec.describe "account_receivables/index", type: :view do
  before(:each) do
    assign(:account_receivables, [
      AccountReceivable.create!(
        :name => "Name",
        :value => "9.99",
        :partner_donations => nil
      ),
      AccountReceivable.create!(
        :name => "Name",
        :value => "9.99",
        :partner_donations => nil
      )
    ])
  end

  it "renders a list of account_receivables" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
