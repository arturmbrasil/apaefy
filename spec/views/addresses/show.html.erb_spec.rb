require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :logradouro => "Logradouro",
      :numero => 2,
      :cep => "Cep",
      :bairro => "Bairro",
      :city => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Logradouro/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Bairro/)
    expect(rendered).to match(//)
  end
end
