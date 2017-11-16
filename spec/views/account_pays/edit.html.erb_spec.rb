require 'rails_helper'

RSpec.describe "account_pays/edit", type: :view do
  before(:each) do
    @account_pay = assign(:account_pay, AccountPay.create!(
      :name => "MyString",
      :nr_nota => 1,
      :value => "9.99"
    ))
  end

  it "renders the edit account_pay form" do
    render

    assert_select "form[action=?][method=?]", account_pay_path(@account_pay), "post" do

      assert_select "input[name=?]", "account_pay[name]"

      assert_select "input[name=?]", "account_pay[nr_nota]"

      assert_select "input[name=?]", "account_pay[value]"
    end
  end
end
