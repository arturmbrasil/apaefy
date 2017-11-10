require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :name => "Name",
        :document_rg => "Document Rg",
        :document_cpf => "Document Cpf",
        :phone_numbers => "Phone Numbers",
        :gender => "Gender"
      ),
      Student.create!(
        :name => "Name",
        :document_rg => "Document Rg",
        :document_cpf => "Document Cpf",
        :phone_numbers => "Phone Numbers",
        :gender => "Gender"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Document Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Document Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Numbers".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
  end
end
