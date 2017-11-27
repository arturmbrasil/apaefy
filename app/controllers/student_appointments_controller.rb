class StudentAppointmentsController < ApplicationController
  before_action :set_student_appointment, only: [:destroy]
  before_action :permit_user

  def index
    respond_to do |format|
      format.csv { send_data StudentAppointment.to_csv }
    end
  end

  def create
    @student_appointment = StudentAppointment.new(student_appointment_params)

    respond_to do |format|
      if @student_appointment.save
        format.html { redirect_to @student_appointment, notice: 'Agendamento cadastrado com sucesso.' }
        format.json { render json: @student_appointment, status: :created, location: @student_appointment }
      else
        format.html { render :new }
        format.json { render json: @student_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student_appointment.destroy
    respond_to do |format|
      format.html { redirect_to student_path(@student_appointment.student_id), notice: 'Agendamento excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student_appointment
    @student_appointment = StudentAppointment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_appointment_params
    params.require(:student_appointment).permit(:student_id, :user_id, :date, :time, :obs)
  end

  def permit_user
    permited_roles = ['director', 'pedagogical_coordinator', 'cr_coordinator']

    unless permited_roles.include? current_user.role
      redirect_to root_path
    end
  end
end
