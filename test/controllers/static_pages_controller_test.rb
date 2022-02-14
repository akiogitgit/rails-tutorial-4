require "test_helper"

# StaticPageのテストが2つ書かれてる
class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # Homeのテスト。getリクエストをHomeにしたら成功になるよね？
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end
end
