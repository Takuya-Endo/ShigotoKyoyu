class MeetingsController < ApplicationController

  def show
    @meeting = Meeting.find(params[:id])
    @event = Event.find(@meeting.event_id)
  end

  def new
    user = User.find(current_user.id)
    @teams = user.teams

    @event = Event.new
    @event.build_meeting
  end

  def create
    @event = Event.new(event_params)
    if @event.save(context: :meeting_create)
      @meeting = Meeting.find_by(event_id: @event.id)
    else
      user = User.find(current_user.id)
      @teams = user.teams
      render :new
    end
  end

  def edit
    user = User.find(current_user.id)
    @teams = user.teams

    @meeting = Meeting.find(params[:id])
    @event = Event.find(@meeting.event_id)
  end

  def update
    meeting = Meeting.find(params[:id])
    event = Event.find(meeting.event_id)
    if event.update(update_event_params)
      redirect_to root_path
    else
      user = User.find(current_user.id)
      @teams = user.teams
      render :edit
    end
  end

  def destroy
    meeting = Meeting.find(params[:id])
    event = Event.find(meeting.event_id)
    event.destroy
    redirect_to root_path
  end

  def complete
    @meeting = Meeting.find(params[:id])
    @event = Event.find(@meeting.event_id)
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :team_id, :appointment_id, :meeting_id, :task_id, :start_date, :end_date, :time_span, :completed, meeting_attributes: [:event_id, :title, :introduction, :participant, :created_at, :updated_at])
  end

  def update_event_params
    params.require(:event).permit(:user_id, :team_id, :appointment_id, :meeting_id, :task_id, :start_date, :end_date, :time_span, :completed, meeting_attributes: [:_destroy, :id, :event_id, :title, :introduction, :participant, :created_at, :updated_at])
  end

end
