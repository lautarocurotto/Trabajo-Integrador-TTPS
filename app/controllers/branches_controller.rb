class BranchesController < ApplicationController
  before_action :set_branch, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /branches or /branches.json
  def index
    @branches = Branch.all
  end

  # GET /branches/1 or /branches/1.json
  def show
    @schedule = Schedule.find(@branch.schedule_id)
    @location = Location.find(@branch.location_id)
  end

  # GET /branches/new
  def new
    @branch = Branch.new
  end

  # GET /branches/1/edit
  def edit
  end

  # POST /branches or /branches.json
  def create
    schedule_params = {monday_start: '2000-01-01 08:00:00', monday_end:'2000-01-01 15:00:00', tuesday_start:'2000-01-01 08:00:00', tuesday_end:'2000-01-01 15:00:00', wednesday_start:'2000-01-01 08:00:00', wednesday_end:'2000-01-01 15:00:00', thursday_start:'2000-01-01 08:00:00', thursday_end:'2000-01-01 15:00:00',friday_start:'2000-01-01 08:00:00',friday_end:'2000-01-01 15:00:00'}
    aux = Schedule.new(schedule_params)
    aux.save
    @branch = Branch.new(branch_params)
    @branch.schedule_id = aux.id

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branch_url(@branch), notice: "La sucursal fue creada con éxito." }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1 or /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to branch_url(@branch), notice: "La sucursal fue actualizada con éxito." }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1 or /branches/1.json
  def destroy
    if (Appointment.find_by(branch_id: @branch.id , state: 'Pendiente'))
      respond_to do |format|
        format.html { redirect_to branches_url, notice: "No se puede destruir porque hay turnos asignados." }
        format.json { head :no_content }
      end
    else
      key = @branch.schedule_id
      @branch.destroy
      Schedule.find(key).destroy
      respond_to do |format|
        format.html { redirect_to branches_url, notice: "La sucursal fue eliminada con éxito." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def branch_params
      params.require(:branch).permit(:name, :address, :phone, :location_id, :schedule_id)
    end
end
