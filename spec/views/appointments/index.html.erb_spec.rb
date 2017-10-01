require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :descricao => "Descricao",
        :student => nil
      ),
      Appointment.create!(
        :descricao => "Descricao",
        :student => nil
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
