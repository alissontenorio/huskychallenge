require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_create_url
    assert_response :success
  end

  test "should get activate" do
    get users_activate_url
    assert_response :success
  end

  test "should get confirm" do
    get users_confirm_url
    assert_response :success
  end
end
