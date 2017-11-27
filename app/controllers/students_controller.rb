# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]
  before_action :permit_user

  # GET /students
  # GET /students.json
  def index
    (@filterrific = initialize_filterrific(
      Student,
      params[:filterrific],
      select_options: {
        sorted_by: Student.options_for_sorted_by,
        sorted_by_restriction: Student.options_for_yes_no,
        sorted_by_use_meds: Student.options_for_yes_no
    }
    )) || return

    @students = @filterrific.find.page params[:page]

    respond_to do |format|
      format.html
      format.csv { send_data @filterrific.find.to_csv }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @appointments = @student.appointments.includes(:user).order(date: :asc, time: :asc)
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @cities = @student.state.cities.map { |city| [city.name, city.id] } if @student.city
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Aluno cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Aluno atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Aluno excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:name, :birthday, :document_rg, :document_cpf, :gender, :city_id, :address_street, :address_number, :address_neighborhood, :address_zip_code, phone_numbers: [])
  end

  def permit_user
    permited_roles = ['human_resources', 'director', 'pedagogical_coordinator', 'cr_coordinator', 'psychologist', 'therapist', 'physiotherapist', 'social_worker', 'secretary']

    unless permited_roles.include? current_user.role
      redirect_to root_path
    end
  end
end
