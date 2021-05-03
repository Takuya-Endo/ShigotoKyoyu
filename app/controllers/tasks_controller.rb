class TasksController < ApplicationController
  def show
  end

  def new
    @event = Event.new
    @event.build_task
  end

  def create
    @event = Event.new(event_params)
    @event.save
    @task = Task.find_by(event_id: @event.id)
  end

  def edit
  end

  def update
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to new_task_path
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :start_date, :time_span, task_attributes: [:id, :event_id, :deadline_status, :title, :introduction, :created_at, :updated_at])
  end

end
