require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         'Bison Hubert'
    assert_equal full_title('Home'), 'Home | Bison Hubert'
  end
end