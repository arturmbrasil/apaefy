require 'rails_helper'

RSpec.describe "account_pays/show", type: :view do
  before(:each) do
    @account_pay = assign(:account_pay, AccountPay.create!(
      :name => "Name",
      :nr_nota => 2,
      :value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
  end
end
