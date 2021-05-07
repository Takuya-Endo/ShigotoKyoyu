class TeamMembersController < ApplicationController

  def destroy
    team_member = TeamMember.find(params[:id])
    team_member.destroy
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

  def change_privilege_confirm
    @team = Team.find(params[:team_id])
    @user = User.find(params[:user_id])
    @team_members = TeamMember.where(user_id: @user.id)
    @team_member = @team_members.find_by(team_id: @team.id)
  end

  def change_privilege_update
    team_member = TeamMember.find(params[:id])
    team_member.update(team_member_params)
    redirect_to teams_path
  end

  private

  def team_member_params
    params.require(:team_member).permit(:user_id, :team_id, :privilege, :join_status, :created_at, :updated_at)
  end

end
