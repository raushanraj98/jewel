require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "", password: "")
  end

  test "email should be present" do
    assert_not @user.valid?
  end

  test "password should be present" do
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.email = "xyz@xyz.com"
    @user.password = "123456"
    @user.save
    @user2 = User.new(email: "xyz@xyz.com", password: "12345")
    assert_not @user2.valid?
  end

  test "email should be less than 105 characters" do
    @user.email = "a" * 105 + "@xyz.com"
    @user.password = "123456"
    assert_not @user.valid?
  end
end
