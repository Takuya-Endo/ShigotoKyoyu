class TeamsController < ApplicationController

  def index
    user = User.find(current_user.id)
    @teams = user.teams
    @team_members = TeamMember.where(user_id: current_user.id)
  end

  def show
    @team = Team.find(params[:id])
    @users = @team.users
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      team_member = TeamMember.new
      team_member.user_id = current_user.id
      team_member.team_id = @team.id
      team_member.privilege = 1
      team_member.join_status = 1
      team_member.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to teams_path
    else
      render :edit
    end
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to teams_path
  end

  def new_team_task
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :number_of_people, :created_at, :updated_at)
  end

end
