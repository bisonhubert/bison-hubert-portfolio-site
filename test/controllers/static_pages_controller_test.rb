require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Bison Hubert"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "Coming Soon | #{@base_title}"
  end

  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get resume" do
    get resume_url
    assert_response :success
  end

  test "should get portfolio" do
    get projects_url
    assert_response :success
    assert_select "title", "Portfolio | #{@base_title}"
  end

end
