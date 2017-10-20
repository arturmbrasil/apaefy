require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :horario => 1,
      :student => nil
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input[name=?]", "appointment[horario]"

      assert_select "input[name=?]", "appointment[student_id]"
    end
  end
end
