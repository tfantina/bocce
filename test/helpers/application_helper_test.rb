require 'test_helper'


class ApplicationHelperTest < ActionView::TestCase

  setup do
    @travis = users(:travis)
  end

  test "First name should be truncated" do
   assert_equal "Travis", truncate_username(@travis.name)
  end
end
