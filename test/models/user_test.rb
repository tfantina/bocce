require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user  = users(:travis)
  end

   test "should be valid" do
    assert @user.valid?
   end

   test "Name is required" do
     @user.name = ""
     assert_not @user.valid?
   end

   test "Email is required" do
     @user.email = ""
     assert_not @user.valid?
   end

   test "Email saved as downcase" do
     mixed_case = "UseR@EXAMple.Com"
     @user.email = mixed_case
     @user.save
     assert_equal mixed_case.downcase, @user.reload.email
   end

   test "Password is required and must have matching confirmation" do
     #password required
     @user.password = ""
     assert_not @user.valid?
     #password must match
     @user.password_confirmation = ""
     assert_not @user.valid?
     if @user.password != @user.password_confirmation do
       assert_not @user.valid?
     end
   end
 end

   test "Password should be 8 char (min)" do
     @user.password = @user.password_confirmation = "a" * 7;
     assert_not @user.valid?
   end

   test "Name should be present" do
     @user.name = ""
     assert_not @user.valid?
   end

   test "birthday is optional" do
     @user.birthday = ""
     assert @user.valid?
   end
end
