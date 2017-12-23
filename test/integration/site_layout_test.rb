require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "site header for logged out user" do
    get root_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
    assert_select "a[href=?]", about_path
  end

  test "site header for logged in user" do
      @user = users(:travis)
      sign_in @user
      get root_path
      assert_select "a[href=?]", destroy_user_session_path
      assert_select ".navbar-text", "Hello Travis"  
  end
  
  


end
