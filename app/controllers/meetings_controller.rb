class MeetingsController < ApplicationController

  def show
  end

  def new
    @event = Event.new
    @event.build_meeting
  end

  def create
    @event = Event.new(event_params)
    @event.save
    @meeting = Meeting.find_by(event_id: @event.id)
  end

  def edit
  end

  def update
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to new_meeting_path
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :start_date, :time_span, meeting_attributes: [:id, :event_id, :title, :introduction, :created_at, :updated_at])
  end


end
