require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'pages/home'
    assert_select "a[href=?]", root_path
    # assert_select "a[href=?]", jobs_index_path
    # assert_select "a[href=?]", jobs_show_path
    # assert_select "a[href=?]", job_applications_index_path
    # assert_select "a[href=?]", job_applications_show_path
  end
end
