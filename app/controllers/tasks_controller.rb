class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
    @event = Event.find(@task.event_id)
  end

  def new
    user = User.find(current_user.id)
    @teams = user.teams

    @event = Event.new
    @event.build_task
  end

  def create
    @event = Event.new(event_params)
    if @event.save(context: :task_create)
      @task = Task.find_by(event_id: @event.id)
    else
      user = User.find(current_user.id)
      @teams = user.teams
      render :new
    end
  end

  def edit
    user = User.find(current_user.id)
    @teams = user.teams

    @task = Task.find(params[:id])
    @event = Event.find(@task.event_id)
  end

  def update
    @task = Task.find(params[:id])
    @event = Event.find(@task.event_id)
    if @event.update(update_event_params)
      redirect_to root_path
    else
      user = User.find(current_user.id)
      @teams = user.teams
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    event = Event.find(task.event_id)
    event.destroy
    redirect_to root_path
  end

  def complete
    @task = Task.find(params[:id])
    @event = Event.find(@task.event_id)
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :team_id, :appointment_id, :meeting_id, :task_id, :start_date, :end_date, :time_span, :completed, task_attributes: [:event_id, :deadline_status, :title, :introduction, :created_at, :updated_at])
  end

  def update_event_params
    params.require(:event).permit(:user_id, :team_id, :appointment_id, :meeting_id, :task_id, :start_date, :end_date, :time_span, :completed, task_attributes: [:_destroy, :id, :event_id, :deadline_status, :title, :introduction, :created_at, :updated_at])
  end


end
