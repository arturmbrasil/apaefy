require 'rails_helper'

RSpec.describe "account_receivables/show", type: :view do
  before(:each) do
    @account_receivable = assign(:account_receivable, AccountReceivable.create!(
      :name => "Name",
      :value => "9.99",
      :partner_donations => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
