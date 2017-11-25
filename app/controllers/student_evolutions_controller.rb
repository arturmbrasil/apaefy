class StudentEvolutionsController < ApplicationController
  before_action :set_student_evolution, only: [:show, :edit, :update, :destroy]

  def create
    @student_evolution = StudentEvolution.new(student_evolution_params)

    respond_to do |format|
      if @student_evolution.save
        format.json { render json: @student_evolution, status: :created, location: @student_evolution }
      else
        format.json { render json: @student_evolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_evolutions/1
  # PATCH/PUT /student_evolutions/1.json
  def update
    respond_to do |format|
      if @student_evolution.update(student_evolution_params)
        format.json { render :show, status: :ok, location: @student_evolution }
      else
        format.json { render json: @student_evolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_evolutions/1
  # DELETE /student_evolutions/1.json
  def destroy
    @student_evolution.destroy
    respond_to do |format|
      format.html { redirect_to student_path(@student_evolution.student_id), notice: 'Evolução excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_evolution
      @student_evolution = StudentEvolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_evolution_params
      params.require(:student_evolution).permit(:student_id, :date, :description)
    end
end
