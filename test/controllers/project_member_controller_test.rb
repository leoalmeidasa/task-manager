require "test_helper"

class ProjectMemberControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_member_index_url
    assert_response :success
  end

  test "should get show" do
    get project_member_show_url
    assert_response :success
  end

  test "should get new" do
    get project_member_new_url
    assert_response :success
  end

  test "should get create" do
    get project_member_create_url
    assert_response :success
  end

  test "should get edit" do
    get project_member_edit_url
    assert_response :success
  end

  test "should get update" do
    get project_member_update_url
    assert_response :success
  end

  test "should get destroy" do
    get project_member_destroy_url
    assert_response :success
  end
end
