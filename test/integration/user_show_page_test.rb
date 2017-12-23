require 'test_helper'
require 'application_system_test_case'


class UserSignupTest < ActionDispatch::IntegrationTest
  setup do
    @travis =  users :travis
    @post1 =  posts :post_one
    sign_in_as @travis
  end
  
  test "shows users posts" do
    get user_path(@travis)
    @travis.posts.each do |post|
     assert_match post.title, response.body
     assert_match post.body, response.body
   end 
  end
  
  
  
  
end
