require 'rails_helper'

RSpec.describe "student_responsibles/show", type: :view do
  before(:each) do
    @student_responsible = assign(:student_responsible, StudentResponsible.create!(
      :name => "Name",
      :phone_number => "Phone Number",
      :responsible_rg => "Responsible Rg",
      :responsible_cpf => "Responsible Cpf",
      :gender => "Gender",
      :student => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Responsible Rg/)
    expect(rendered).to match(/Responsible Cpf/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(//)
  end
end
