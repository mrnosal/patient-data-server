require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "labeled field" do
    assert_equal "<div class='labeled_field'><span class='label'>foo</span><span class='value'>bar</span></div>",
                 labeled_field("foo", "bar")
  end

  test "date_formatter" do
    time = Time.new(2001, 1, 1)
    assert_equal "01-Jan-2001", date(time)
    # Check defaulting behavior with optional parameter
    assert_equal 'present', date(nil, 'present')
    # Check defaulting behavior with default value
    assert_equal 'never', date(nil)
  end

  test "breadcrumbs" do
    @bc = [:title => "abc", :link => "/"]
    assert_equal "<a href='/'>abc</a>", show_breadcrumbs
    @bc = [{:title => "abc", :link => "/"}, {:title => "def"}]
    assert_equal "<a href='/'>abc</a>&nbsp;|&nbsp;def", show_breadcrumbs
  end

  def breadcrumbs
    @bc
  end
end