class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_options_for_select, only:  [:new, :edit, :update, :create]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @prescriptions = @student.prescriptions.includes(:medicine)
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: t('CriacaoAluno') }
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
        format.html { redirect_to @student, notice: t('AlteracaoAluno') }
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
      format.html { redirect_to students_url, notice: t('ExclusaoAluno') }
      format.json { head :no_content }
    end
  end


  private
    def set_options_for_select
      @medicine_options_for_select = Medicine.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:nome, :data_nascimento, :rg_aluno, :cpf_aluno, :telefone, :sexo,
        prescriptions_attributes: [:id, :medicine_id, :dosagem, :intervalo_tempo, :_destroy],
        responsibles_attributes: [:id, :nome, :data_nascimento, :telefone, :rg, :cpf, :_destroy],
        student_food_restrictions_attributes: [:id, :food_restriction_id, :_destroy],
        special_needs_attributes: [:id, :descricao, :_destroy])
    end
end
