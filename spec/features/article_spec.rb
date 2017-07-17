require 'rails_helper'

describe 'article actions', :type => :feature do
  context '#post' do
    it 'adds an new article and redirects to article show page' do
      article = FactoryGirl.build(:article)
      visit new_article_path
      expect(page).to have_title('New Article')
      fill_in 'Title', with: article.title
      fill_in 'Summary', with: article.summary
      fill_in 'Text', with: article.text
      fill_in 'Image', with: article.image
      click_button('Create Article')
      expect(page).to have_title(article.title)
      expect(page).to have_text(article.text)
    end
  end
end