require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :horario => 2,
        :student => nil
      ),
      Appointment.create!(
        :horario => 2,
        :student => nil
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
