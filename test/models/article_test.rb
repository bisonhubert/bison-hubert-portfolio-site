require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = Article.new(title: 'Test Article', text: 'Sample text', summary: 'This is a test article', image: 'fakeimage.jpg')
  end

  test 'should be valid' do
    assert @article.valid?
  end

  test 'title should be present' do
    @article.title = ''
    assert_not @article.valid?
  end

  test 'title should not be too short' do
    @article.title = '%' * 4
    assert_not @article.valid?
  end

  test 'text should be present' do
    @article.text = ''
    assert_not @article.valid?
  end

  test 'summary should be present' do
    @article.summary = ''
    assert_not @article.valid?
  end

  test 'summary should not be too long' do
    @article.summary = '%' * 141
    assert_not @article.valid?
  end

  test 'image should be present' do
    @article.image = ''
    assert_not @article.valid?
  end
end
