class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    team = Team.new(team_params)
    team.save

    team_member = TeamMember.new
    team_member.user_id = current_user.id
    team_member.team_id = team.id
    team_member.privilege = 1
    team_member.join_status = 1
    team_member.save

    redirect_to teams_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :number_of_people, :created_at, :updated_at)
  end

end
