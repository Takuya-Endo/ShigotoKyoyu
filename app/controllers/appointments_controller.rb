class AppointmentsController < ApplicationController

  def show
    @appointment = Appointment.find(params[:id])
    @event = Event.find(@appointment.event_id)
  end

  def new
    user = User.find(current_user.id)
    @teams = user.teams

    @event = Event.new
    @event.build_appointment
  end

  def create
    @event = Event.new(event_params)
    if @event.save(context: :appointment_create)
      @appointment = Appointment.find_by(event_id: @event.id)
    else
      user = User.find(current_user.id)
      @teams = user.teams
      render :new
    end
  end

  def edit
    user = User.find(current_user.id)
    @teams = user.teams

    @appointment = Appointment.find(params[:id])
    @event = Event.find(@appointment.event_id)
  end

  def update
    appointment = Appointment.find(params[:id])
    event = Event.find(appointment.event_id)
    if event.update(update_event_params)
      redirect_to root_path
    else
      user = User.find(current_user.id)
      @teams = user.teams
      render :edit
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    event = Event.find(appointment.event_id)
    event.destroy
    redirect_to root_path
  end

  def complete
    @appointment = Appointment.find(params[:id])
    @event = Event.find(@appointment.event_id)
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :team_id, :appointment_id, :meeting_id, :task_id, :start_date, :end_date, :time_span, :completed, appointment_attributes: [:event_id, :destination, :person_in_charge, :contact_means, :nearest_station, :travel_time, :preparation_time, :participant, :created_at, :updated_at])
  end

  def update_event_params
    params.require(:event).permit(:user_id, :team_id, :appointment_id, :meeting_id, :task_id, :start_date, :end_date, :time_span, :completed, appointment_attributes: [:_destroy, :id, :event_id, :destination, :person_in_charge, :contact_means, :nearest_station, :travel_time, :preparation_time, :participant, :created_at, :updated_at])
  end

end
