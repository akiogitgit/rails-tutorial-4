require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Ruby on Rails Tutorial App"
  end

  test "should get new" do
    # get users_new_path
    get signup_path
    assert_response :success
    assert_select "title", "Sign up | #{@base_title}"
  end
end
