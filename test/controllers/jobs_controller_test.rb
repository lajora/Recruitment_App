require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    follow_redirect!
    assert_response :success
  end
  test "should get index" do
    get jobs_path
    assert_response :success
  end

  test "should get show" do
    get job_path(jobs)
    assert_response :success
  end

  test "should get new" do
    get new_job_path
    assert_response :success
  end
  
  test "should get edit" do
    get edit_job_path(jobs)
    assert_response :success
  end
end
