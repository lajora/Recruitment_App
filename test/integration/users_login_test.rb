require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do 
    get new_user_session_path 
    assert_template 'devise/sessions/new'
    post user_session_path, params: {session: {email:"", password:""} }
    assert_template 'devise/sessions/new'
  end

  test "login with valid information" do
    get new_user_session_path 
    assert_template 'devise/sessions/new'
    post user_session_path, params: {session: {email:"user@example.com", password:"123456"} }
    assert_template 'devise/shared/_links' 
    # assert_select"a[href=?]", new_user_session_path, count : 0 
    # assert_select"a[href=?]", destroy_user_session_path
    # assert_select"a[href=?]", user_session_path(@user)
  end
end
