class ContaAPagarsController < ApplicationController
  before_action :set_conta_a_pagar, only: [:show, :edit, :update, :destroy]

  # GET /conta_a_pagars
  # GET /conta_a_pagars.json
  def index
    @conta_a_pagars = ContaAPagar.all
  end

  # GET /conta_a_pagars/1
  # GET /conta_a_pagars/1.json
  def show
  end

  # GET /conta_a_pagars/new
  def new
    @conta_a_pagar = ContaAPagar.new
  end

  # GET /conta_a_pagars/1/edit
  def edit
  end

  # POST /conta_a_pagars
  # POST /conta_a_pagars.json
  def create
    @conta_a_pagar = ContaAPagar.new(conta_a_pagar_params)

    respond_to do |format|
      if @conta_a_pagar.save
        format.html { redirect_to @conta_a_pagar, notice: 'Conta a pagar criada com sucesso!' }
        format.json { render :show, status: :created, location: @conta_a_pagar }
      else
        format.html { render :new }
        format.json { render json: @conta_a_pagar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conta_a_pagars/1
  # PATCH/PUT /conta_a_pagars/1.json
  def update
    respond_to do |format|
      if @conta_a_pagar.update(conta_a_pagar_params)
        format.html { redirect_to @conta_a_pagar, notice: 'Conta a pagar alterada com sucesso!' }
        format.json { render :show, status: :ok, location: @conta_a_pagar }
      else
        format.html { render :edit }
        format.json { render json: @conta_a_pagar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conta_a_pagars/1
  # DELETE /conta_a_pagars/1.json
  def destroy
    @conta_a_pagar.destroy
    respond_to do |format|
      format.html { redirect_to conta_a_pagars_url, notice: 'Conta a pagar excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta_a_pagar
      @conta_a_pagar = ContaAPagar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conta_a_pagar_params
      params.require(:conta_a_pagar).permit(:dt_vencimento, :nome, :nr_nota, :valor)
    end
end
