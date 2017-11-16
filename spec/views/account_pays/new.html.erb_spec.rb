require 'rails_helper'

RSpec.describe "account_pays/new", type: :view do
  before(:each) do
    assign(:account_pay, AccountPay.new(
      :name => "MyString",
      :nr_nota => 1,
      :value => "9.99"
    ))
  end

  it "renders new account_pay form" do
    render

    assert_select "form[action=?][method=?]", account_pays_path, "post" do

      assert_select "input[name=?]", "account_pay[name]"

      assert_select "input[name=?]", "account_pay[nr_nota]"

      assert_select "input[name=?]", "account_pay[value]"
    end
  end
end
