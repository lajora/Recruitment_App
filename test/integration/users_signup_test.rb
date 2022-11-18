require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path params: { user: { first_name: "",
                                                    last_name: "",
                                                    email: "user@invalid",
                                                    password:              "foo",
                                                    password_confirmation: "bar" }}
    end
    assert_template 'devise/registrations/new'
  end

  test "valid signup information" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path params: { user: { first_name: "User",
                                                    last_name: "Example",
                                                    email: "user@valid.com",
                                                    password:              "123456",
                                                    password_confirmation: "123456"}}
    end
    follow_redirect!
    assert_template 'pages/home'
  end
end
