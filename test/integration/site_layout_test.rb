require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", jobs_path(jobs)
    assert_select "a[href=?]", job_path(jobs)
    assert_select "a[href=?]", job_job_applications_path(users)
    assert_select "a[href=?]", job_job_application_path(jobs)
  end
end
