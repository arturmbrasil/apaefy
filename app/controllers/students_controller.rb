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
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.build_address
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
        format.html { redirect_to @student, notice: 'Criado com sucesso.' }
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
        format.html { redirect_to @student, notice: 'Alterado com sucesso.' }
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
      format.html { redirect_to students_url, notice: 'Excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_options_for_select
      @cities_options_for_select = City.all
      @frota_options_for_select = Frota.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:nome, :data_nascimento, :rg_aluno, :cpf_aluno, :telefone, :sexo, :frota_id,
        medicines_attributes: [:id, :nome, :dosagem, :intervalo_tempo, :_destroy],
        responsibles_attributes: [:id, :nome, :data_nascimento, :telefone, :rg, :cpf, :_destroy],
        food_restrictions_attributes: [:id, :restriction, :_destroy],
        special_needs_attributes: [:id, :descricao, :_destroy],
        address_attributes: [:logradouro, :numero, :cep, :bairro, :city_id])
    end
end
