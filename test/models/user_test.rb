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
end
