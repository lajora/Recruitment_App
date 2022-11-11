require "test_helper"

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get job_applications_index_path
    assert_response :success
  end

  test "should get show" do
    get job_applications_show_path # !!!!we need to change path name because too similar to index!!!!
    assert_response :success
  end
end
