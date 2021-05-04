class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
    @event = Event.find(@task.event_id)
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
    @task = Task.find(params[:id])
    @event = Event.find(@task.event_id)
  end

  def update
    task = Task.find(params[:id])
    event = Event.find(task.event_id)
    event.update(update_event_params)
    redirect_to root_path
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to new_task_path
  end

  def complete
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :task_id, :start_date, :end_date, :time_span, task_attributes: [:event_id, :deadline_status, :title, :introduction, :created_at, :updated_at])
  end

  def update_event_params
    params.require(:event).permit(:user_id, :task_id, :start_date, :end_date, :time_span, task_attributes: [:_destroy, :id, :event_id, :deadline_status, :title, :introduction, :created_at, :updated_at])
  end


end
