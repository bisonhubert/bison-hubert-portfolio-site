require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Bison Hubert"
  end

  test "should get articles index" do
    get articles_path
    assert_response :success
    assert_select "title", "Bison Blogs | #{@base_title}"
  end

  test "should get blog" do
    get bisonblogs_path
    assert_response :success
    assert_select "title", "Bison Blogs | #{@base_title}"
  end

  test "should get new article form" do
    get new_article_path
    assert_response :success
    assert_select "title", "New Article | #{@base_title}"
  end
end
