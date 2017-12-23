require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  #include Devise::Test::IntegrationHelpers

  #def sign_in_as(user)
  #  post user_session_path, params: {email: user.email,
  #          password: user.password}
  #end

  def sign_out(user)
    delete destroy_user_session_path
  end

  setup do
    @travis = users(:travis)
    sign_in_as @travis
  end

  test "can sign in" do
    assert_not flash.empty?
  end

   test "user can sign in" do
     sign_in_as users(:travis)
     assert_not flash.empty?
   end

   test "user can sign out" do
     sign_out users(:travis)
   end

end
