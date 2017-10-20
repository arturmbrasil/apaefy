require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :logradouro => "MyString",
      :numero => 1,
      :cep => "MyString",
      :bairro => "MyString",
      :city => nil
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input[name=?]", "address[logradouro]"

      assert_select "input[name=?]", "address[numero]"

      assert_select "input[name=?]", "address[cep]"

      assert_select "input[name=?]", "address[bairro]"

      assert_select "input[name=?]", "address[city_id]"
    end
  end
end
