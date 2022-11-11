require "test_helper"

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get job_job_applications_path(:job_id)
    assert_response :success
  end

  test "should get show" do
    get job_job_application_path(:job_id, :job_application_id) # !!!!we need to change path name because too similar to index!!!!
    assert_response :success
  end
end
