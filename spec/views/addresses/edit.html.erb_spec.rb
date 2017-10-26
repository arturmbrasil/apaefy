require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :logradouro => "MyString",
      :numero => 1,
      :cep => "MyString",
      :bairro => "MyString",
      :city => nil
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input[name=?]", "address[logradouro]"

      assert_select "input[name=?]", "address[numero]"

      assert_select "input[name=?]", "address[cep]"

      assert_select "input[name=?]", "address[bairro]"

      assert_select "input[name=?]", "address[city_id]"
    end
  end
end
