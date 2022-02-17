require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  # 空文字は許さないよね？(assert_notで逆の意味)
  test "name should be present" do
    @user.name =""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  # name をこの長さにしたらダメだよね？
  test "name should not be too long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"*244 + "@example.com"
    assert_not @user.valid?
  end

  # 有効なメールのテスト
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end
  
  # このemailだとエラーだよね？
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[aa@aa..a user@example,com user_at_foo.org user.name@example]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  # 同じemailはダメだよね？
  test "email addressses should be unique" do
    duplicate_user = @user.dup # dupでダブってるuser
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  # saveしたら、downcaseになるよね？
  test "email address should be saved as lower-case" do
    email_upcase = "Foo@ExamPle.Com"
    @user.email = email_upcase
    @user.save
    assert_equal email_upcase.downcase,  @user.email
  end

  # password, password_confirmation は空だとダメだよね？
  test "password should be present (nonblank)" do 
    @user.password = @user.password_confirmation = " " * 6 # 2つ同時に代入
    assert_not @user.valid?
  end

  # この２つのカラムは、文字数は5文字だとだめだよね？
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  # add-migrate-generate
end
