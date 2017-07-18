require 'rails_helper'

describe 'Admin' do
  context 'logged out' do
    describe 'StaticPages #home' do
      it 'displays logout link & hides login link' do
        visit root_path
        expect(page).to have_link('Login')
        expect(page).not_to have_link('Logout')
      end
    end

    describe 'StaticPages #about' do
      it 'displays logout link & hides login link' do
        visit about_path
        expect(page).to have_link('Login')
        expect(page).not_to have_link('Logout')
      end
    end
    
    describe 'Articles #index' do
      it 'displays login link & hides logout, new article links' do
        visit blog_path
        expect(page).to have_link('Login')
        expect(page).not_to have_link('Logout')
        expect(page).not_to have_link('New Article')
      end
    end

    describe 'Articles #show' do
      it 'displays login link & hides logout, edit article, delete article links' do
        article = FactoryGirl.create(:article)
        visit article_path(article)
        expect(page).to have_link('Login')
        expect(page).not_to have_link('Logout')
        expect(page).not_to have_link('Edit Article')
        expect(page).not_to have_link('Delete Article')
      end
    end

    describe 'Projects #index' do
      it 'displays login link & hides logout, new project links' do
        visit portfolio_path
        expect(page).to have_link('Login')
        expect(page).not_to have_link('Logout')
        expect(page).not_to have_link('New Project')
      end
    end

    describe 'Projects #show' do
      it 'displays login link & hides logout, edit project, delete project links' do
        project = FactoryGirl.create(:project)
        visit project_path(project)
        expect(page).to have_link('Login')
        expect(page).not_to have_link('Logout')
        expect(page).not_to have_link('Edit Project')
        expect(page).not_to have_link('Delete Project')
      end
    end
  end
end