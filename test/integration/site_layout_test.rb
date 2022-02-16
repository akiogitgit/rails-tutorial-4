require "test_helper"

# integration-test
class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "the truth" do
    # このページでテスト
    get root_path

    # リンクが正しいかのテスト
    assert_template "static_pages/home" # アクセスできる？
    #             このタグをテスト
    assert_select "a[href=?]", root_path #, count: 2 # ロゴと、ヘッダーに２つある場合
    assert_select "a[href=?]", help_path # ?にpathが入る
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "h1", "Welcome to the Sample App" # <h1>Welcome to...</h1>
    assert_select "ul.nav" # <ul class="nav"></ul> "div#nav"で ID

    # test_helperで、full_titleを使えるようにする。
    get contact_path
    assert_select "title", full_title("Contact")

    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
