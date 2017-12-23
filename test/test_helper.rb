require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'

Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.

  fixtures :all
  # Add more helper methods to be used by all tests here...

  def sign_in_as(user)
    post user_session_path, params: {email: user.email,
                                     password: user.password}
  end
end
