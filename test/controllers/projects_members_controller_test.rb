require "test_helper"

class ProjectsMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get projects_members_index_url
    assert_response :success
  end

  test "should get show" do
    get projects_members_show_url
    assert_response :success
  end

  test "should get new" do
    get projects_members_new_url
    assert_response :success
  end

  test "should get create" do
    get projects_members_create_url
    assert_response :success
  end

  test "should get edit" do
    get projects_members_edit_url
    assert_response :success
  end

  test "should get update" do
    get projects_members_update_url
    assert_response :success
  end

  test "should get destroy" do
    get projects_members_destroy_url
    assert_response :success
  end
end
