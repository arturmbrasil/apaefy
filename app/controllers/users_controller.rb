class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    (@filterrific = initialize_filterrific(
      User,
      params[:filterrific],
      select_options: { sorted_by: User.options_for_sorted_by, sorted_by_role: User.options_for_sorted_by_role }
    )) || return

    @users = @filterrific.find.page params[:page]

    respond_to do |format|
      format.html
      format.csv { send_data User.to_csv }
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @cities = @user.state.cities.map { |city| [city.name, city.id] } if @user.city
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'Funcionário foi cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'Funcionário foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Funcionário foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params
      .require(:user)
      .permit(:name, :role, :document_cnh, :document_cns, :email, :password, :gender, :birthday, :document_rg, :document_cpf, :admission_date, :city_id, :address_street, :address_number, :address_neighborhood, :address_zip_code, phone_numbers: [])
  end
end
