require 'rails_helper'

RSpec.describe "student_responsibles/index", type: :view do
  before(:each) do
    assign(:student_responsibles, [
      StudentResponsible.create!(
        :name => "Name",
        :phone_number => "Phone Number",
        :responsible_rg => "Responsible Rg",
        :responsible_cpf => "Responsible Cpf",
        :gender => "Gender",
        :student => nil
      ),
      StudentResponsible.create!(
        :name => "Name",
        :phone_number => "Phone Number",
        :responsible_rg => "Responsible Rg",
        :responsible_cpf => "Responsible Cpf",
        :gender => "Gender",
        :student => nil
      )
    ])
  end

  it "renders a list of student_responsibles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Responsible Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Responsible Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
