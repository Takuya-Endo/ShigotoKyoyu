class EventsController < ApplicationController

  def index
    user = User.find(current_user.id)
    teams = user.teams
    @events = Event.where(user_id: current_user.id).or(Event.where(team_id: teams.ids))
  end

  def new
  end

end
