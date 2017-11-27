class FleetsController < ApplicationController
  before_action :set_fleet, only: [:show, :edit, :update, :destroy]
  before_action :permit_user

  # GET /fleets
  # GET /fleets.json
  def index
    (@filterrific = initialize_filterrific(
      Fleet,
      params[:filterrific],
      select_options: {
        sorted_by: Fleet.options_for_sorted_by,
      }
    )) || return

    @fleets = @filterrific
      .find
      .includes(:driver)
      .joins(:driver)
      .page params[:page]

    respond_to do |format|
      format.html
      format.csv { send_data @filterrific.find.to_csv }
    end
  end

  # GET /fleets/1
  # GET /fleets/1.json
  def show
    @students = @fleet.students.includes(:city)
  end

  # GET /fleets/new
  def new
    @students = Student.where(fleet: nil)
    @drivers = User.where(role: :driver)
    @fleet = Fleet.new
  end

  # GET /fleets/1/edit
  def edit
    @students = Student.where(fleet: nil).or(Student.where(fleet: @fleet))
    @drivers = User.where(role: :driver)
  end

  # POST /fleets
  # POST /fleets.json
  def create
    @fleet = Fleet.new(fleet_params)

    respond_to do |format|
      if @fleet.save
        format.html { redirect_to fleets_url, notice: 'Fleet was successfully created.' }
        format.json { render :show, status: :created, location: @fleet }
      else
        format.html { render :new }
        format.json { render json: @fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fleets/1
  # PATCH/PUT /fleets/1.json
  def update
    respond_to do |format|
      if @fleet.update(fleet_params)
        format.html { redirect_to fleets_url, notice: 'Fleet was successfully updated.' }
        format.json { render :show, status: :ok, location: @fleet }
      else
        format.html { render :edit }
        format.json { render json: @fleet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fleets/1
  # DELETE /fleets/1.json
  def destroy
    @fleet.destroy
    respond_to do |format|
      format.html { redirect_to fleets_url, notice: 'Fleet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_fleet
    @fleet = Fleet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fleet_params
    params.require(:fleet).permit(:name, :vehicle, :license_plate, :document_renavam, :chassis, :driver_id, :starting_address, :destination_address, student_ids: [])
  end

  def permit_user
    if current_user.role != 'finance' && current_user.role != 'driver' && current_user.role != 'director'
      redirect_to root_path
    end
  end
end
