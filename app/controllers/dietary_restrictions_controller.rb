class DietaryRestrictionsController < ApplicationController
  before_action :set_dietary_restriction, only: [:destroy]

  def create
    @dietary_restriction = DietaryRestriction.new(dietary_restriction_params)

    respond_to do |format|
      if @dietary_restriction.save
        format.json { render json: @dietary_restriction, status: :created, location: @dietary_restriction }
      else
        format.json { render json: @dietary_restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dietary_restriction.destroy
    respond_to do |format|
      format.html { redirect_to student_path(@dietary_restriction.student_id), notice: 'Restrição alimentar excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dietary_restriction
      @dietary_restriction = DietaryRestriction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dietary_restriction_params
      params.require(:dietary_restriction).permit(:restriction, :student_id)
    end
end
