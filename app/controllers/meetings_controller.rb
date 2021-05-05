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
    @meeting = Meeting.find(params[:id])
    @event = Event.find(@meeting.event_id)
  end

  def update
    meeting = Meeting.find(params[:id])
    event = Event.find(meeting.event_id)
    event.update(update_event_params)
    redirect_to root_path
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to new_meeting_path
  end

  def complete
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :team_id, :meeting_id, :start_date, :end_date, :time_span, meeting_attributes: [:event_id, :title, :introduction, :created_at, :updated_at])
  end

  def update_event_params
    params.require(:event).permit(:user_id, :team_id, :meeting_id, :start_date, :end_date, :time_span, meeting_attributes: [:_destroy, :id, :event_id, :title, :introduction, :created_at, :updated_at])
  end

end
