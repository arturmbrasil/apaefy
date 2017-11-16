class StudentResponsiblesController < ApplicationController
  before_action :set_student_responsible, only: [:show, :edit, :update, :destroy]

  def create
    @student_responsible = StudentResponsible.new(student_responsible_params)

    respond_to do |format|
      if @student_responsible.save
        format.json { render json: @student_responsible, status: :created, location: @student_responsible }
      else
        format.json { render json: @student_responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student_responsible.destroy
    respond_to do |format|
      format.html { redirect_to student_path(@student_responsible.student_id), notice: 'Responsável excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_responsible
      @student_responsible = StudentResponsible.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_responsible_params
      params.require(:student_responsible).permit(:name, :birth_date, :phone_number, :responsible_rg, :responsible_cpf, :gender, :student_id)
    end
end
