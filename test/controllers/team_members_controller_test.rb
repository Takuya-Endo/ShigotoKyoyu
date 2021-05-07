require 'test_helper'

class TeamMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get team_members_destroy_url
    assert_response :success
  end

  test "should get search_box" do
    get team_members_search_box_url
    assert_response :success
  end

  test "should get search" do
    get team_members_search_url
    assert_response :success
  end

  test "should get invit" do
    get team_members_invit_url
    assert_response :success
  end

  test "should get change_privilege_confirm" do
    get team_members_change_privilege_confirm_url
    assert_response :success
  end

  test "should get change_privilege_update" do
    get team_members_change_privilege_update_url
    assert_response :success
  end

end
