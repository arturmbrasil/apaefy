require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :name => "Name",
      :document_rg => "Document Rg",
      :document_cpf => "Document Cpf",
      :phone_numbers => "Phone Numbers",
      :gender => "Gender"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Document Rg/)
    expect(rendered).to match(/Document Cpf/)
    expect(rendered).to match(/Phone Numbers/)
    expect(rendered).to match(/Gender/)
  end
end
