require 'rails_helper'

RSpec.describe "account_receivables/edit", type: :view do
  before(:each) do
    @account_receivable = assign(:account_receivable, AccountReceivable.create!(
      :name => "MyString",
      :value => "9.99",
      :partner_donations => nil
    ))
  end

  it "renders the edit account_receivable form" do
    render

    assert_select "form[action=?][method=?]", account_receivable_path(@account_receivable), "post" do

      assert_select "input[name=?]", "account_receivable[name]"

      assert_select "input[name=?]", "account_receivable[value]"

      assert_select "input[name=?]", "account_receivable[partner_donations_id]"
    end
  end
end
