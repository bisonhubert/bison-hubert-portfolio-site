require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", portfolio_path
    assert_select "a[href=?]", blog_path
    assert_select "a[href=?]", about_path

    get portfolio_path
    assert_template 'static_pages/under_construction'
    assert_select "h1", "Bison Hubert Portfolio Site"

    get blog_path
    assert_template 'articles/index'
    assert_select "a[href=?]", portfolio_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", home_path

    get about_path
    assert_template 'static_pages/about'
    assert_select "a[href=?]", portfolio_path
    assert_select "a[href=?]", blog_path
    assert_select "a[href=?]", home_path
  end
end