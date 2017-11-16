require 'rails_helper'

RSpec.describe "account_receivables/new", type: :view do
  before(:each) do
    assign(:account_receivable, AccountReceivable.new(
      :name => "MyString",
      :value => "9.99",
      :partner_donations => nil
    ))
  end

  it "renders new account_receivable form" do
    render

    assert_select "form[action=?][method=?]", account_receivables_path, "post" do

      assert_select "input[name=?]", "account_receivable[name]"

      assert_select "input[name=?]", "account_receivable[value]"

      assert_select "input[name=?]", "account_receivable[partner_donations_id]"
    end
  end
end
