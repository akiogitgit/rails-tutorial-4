require "test_helper"

# StaticPageのテストが2つ書かれてる
class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # 変数も使える
  def setup
    @base_title = "Ruby on Rails Tutorial App"
  end

  # Homeのテスト。getリクエストをHomeにしたら成功になるよね？
  test "should get home" do
    # get static_pages_home_url # 変数。rails/infoで確認できるやつ
    get root_path
    assert_response :success # ちゃんとアクセスできる？
    assert_select "title", "Home | Ruby on Rails Tutorial App" # このページのtitleこれ？
  end

  test "should get help" do
    # get static_pages_help_url # これは変数でpathが入っている
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    # get static_pages_about_url
    get help_about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    # get static_pages_contact_url
    get help_contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
