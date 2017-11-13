class MedicinesController < ApplicationController
  before_action :set_medicine, only: [:destroy]

  def create
    @medicine = Medicine.new(medicine_params)

    respond_to do |format|
      if @medicine.save
        format.json { render json: @medicine, status: :created, location: @medicine }
      else
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @medicine.destroy
    respond_to do |format|
      format.html { redirect_to student_path(@medicine.student_id), notice: 'Medicamento excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_medicine
    @medicine = Medicine.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def medicine_params
    params.require(:medicine).permit(:name, :dosage, :time_interval, :student_id)
  end
end
