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
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to teams_path
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to teams_path
  end

  def search_box
    @team = Team.find(params[:id])
  end

  def search
    @team = Team.find(params[:id])
    @users = User.all
    if params[:search].present?
      @team_members = TeamMember.where(team_id: @team.id)
      @user = @users.find_by(email: params[:search])
    else
    end
  end

  def invit
    team_member = TeamMember.new(team_member_params)
    team_member.save
    @team = Team.find(team_member.team_id)
    redirect_to users_path(team_id: @team.id)
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :number_of_people, :created_at, :updated_at)
  end

  def team_member_params
    params.require(:team_member).permit(:user_id, :team_id, :privilege, :join_status, :created_at, :updated_at)
  end

end
