require "test_helper"

# StaticPageのテストが2つ書かれてる
class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # 変数も使える
  def setup
    @base_title = "Ruby on Rails Tutorial App"
  end

  # Homeのテスト。getリクエストをHomeにしたら成功になるよね？
  test "should get home" do
    get static_pages_home_url
    assert_response :success # ちゃんとアクセスできる？
    assert_select "title", "Home | Ruby on Rails Tutorial App" # このページのtitleこれ？
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end
