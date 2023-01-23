class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.all
    @user = current_user
  end

  # GET /appointments/1 or /appointments/1.json
  def show
    if(current_user.role == 'staff')
      if (current_user.assignedbranch != @appointment.branch_id)
        redirect_to appointments_url
      end
    else
      if (current_user.id != @appointment.user_id)
        redirect_to appointments_url
      end
    end
    @branch = Branch.find(@appointment.branch_id) 
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
    if (current_user.role == 'staff')
      if (current_user.assignedbranch != @appointment.branch_id)
        redirect_to appointments_url
      end
    end
    if (current_user.role == 'client')
      if current_user.id != @appointment.user_id
        redirect_to appointments_url
      end
    end
    if @appointment.state == 'Atendido'
      redirect_to appointments_url
    end
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    branch = Branch.find(@appointment.branch_id)
    schedule = Schedule.find(branch.schedule_id)
    case
    when @appointment.date.monday?
      if (@appointment.hour.between? schedule.monday_start , schedule.monday_end )
        should_create = true
      end
    when @appointment.date.tuesday?
      if (@appointment.hour.between? schedule.tuesday_start , schedule.tuesday_end )
        should_create = true
      end
    when @appointment.date.wednesday?
      if (@appointment.hour.between? schedule.wednesday_start , schedule.wednesday_end )
        should_create = true
      end
    when @appointment.date.thursday?
      if (@appointment.hour.between? schedule.thursday_start , schedule.thursday_end )
        should_create = true
      end
    when @appointment.date.friday?
      if (@appointment.hour.between? schedule.friday_start , schedule.friday_end )
        should_create = true
      end
    when @appointment.date.saturday?
      if (@appointment.hour.between? schedule.saturday_start , schedule.saturday_end )
        should_create = true
      end
    when @appointment.date.sunday?
      if (@appointment.hour.between? schedule.sunday_start , schedule.sunday_end )
        should_create = true
      end
    else
      should_create = false
    end

    if (!should_create)
      respond_to do |format|
        format.html { redirect_to appointments_url, notice: "El día y horario seleccionados no está dentro de los de la sucursal seleccionada." }
      end
    else
      @appointment.user_id = current_user.id
      @appointment.state = 'Pendiente'
      respond_to do |format|
        if @appointment.save
          format.html { redirect_to appointment_url(@appointment), notice: "El turno fue creado con éxito." }
          format.json { render :show, status: :created, location: @appointment }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    branch = Branch.find(@appointment.branch_id)
    schedule = Schedule.find(branch.schedule_id)
    appointment_date = appointment_params[:date]
    appointment_date = appointment_date.to_s
    appointment_date = appointment_date.to_date
    appointment_hour = appointment_params[:hour]
    if !appointment_params[:comment]
      entered = true
      aux = '2000-01-01 ' + appointment_hour
      appointment_hour = Time.find_zone('UTC').parse(aux)
      case
      when appointment_date.monday?
        if (appointment_hour.between? schedule.monday_start , schedule.monday_end )
          should_create = true
        end
      when appointment_date.tuesday?
        if (appointment_hour.between? schedule.tuesday_start , schedule.tuesday_end )
          should_create = true
        end
      when appointment_date.wednesday?
        if (appointment_hour.between? schedule.wednesday_start , schedule.wednesday_end )
          should_create = true
        end
      when appointment_date.thursday?
        if (appointment_hour.between? schedule.thursday_start , schedule.thursday_end )
          should_create = true
        end
      when appointment_date.friday?
        if (appointment_hour.between? schedule.friday_start , schedule.friday_end )
          should_create = true
        end
      when @appointment.date.saturday?
        if (@appointment.hour.between? schedule.saturday_start , schedule.saturday_end )
          should_create = true
        end
      when @appointment.date.sunday?
        if (@appointment.hour.between? schedule.sunday_start , schedule.sunday_end )
          should_create = true
        end
      else
        puts 'Entró al else'
        should_create = false
      end
    end
    if entered
      if !should_create
        puts 'hola'
        puts should_create
        puts 'entró al should create'
        respond_to do |format|
          format.html { redirect_to appointments_url, notice: "El día y horario seleccionados no está dentro de los de la sucursal seleccionada." }
        end
      else
        respond_to do |format|
          if @appointment.update(appointment_params)
            puts "Entro al 1"
            format.html { redirect_to appointment_url(@appointment), notice: "El turno fue actualizado con éxito." }
            format.json { render :show, status: :ok, location: @appointment }
          end
        end
      end  
    else
      respond_to do |format|
        puts "Entro al 2"
        if @appointment.update(appointment_params)
          format.html { redirect_to appointment_url(@appointment), notice: "El turno fue atendido con éxito." }
          format.json { render :show, status: :ok, location: @appointment }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "El turno fue cancelado con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:date, :hour, :reason, :branch_id, :state, :attended_by, :comment)
    end
end
