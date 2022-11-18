require "test_helper"

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    follow_redirect!
    assert_response :success
  end

  test "should get index" do
    get job_job_applications_path(users)
    assert_response :success
  end

  test "should get new" do 
    get job_job_applications_path(jobs)
    assert_response :success
  end
end
