require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(first_name: "Jobstantial", last_name: "User", email: "user@job.com")
  end

  test "should be valid" do
    @user.valid?
  end

  test "first_name should be present" do 
    @user.first_name = "     "
    assert_not @user.valid?
  end 

  test "last_name should be present" do
    @user.last_name = "     "
    assert_not @user.valid?
  end 

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "password should be present" do 
    @user.password = "     " 
    assert_not @user.valid?
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end 

  test 'email validation should accept valid addresses' do 
    valid_addresses = %w[user@job.com USER@foo.COM A_US-ER@foo.bar.org 
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
end
