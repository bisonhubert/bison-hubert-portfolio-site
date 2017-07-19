require 'rails_helper'

describe 'Site Navigation' do
  context 'does not display nav link for current page' do
    describe 'StaticPages #home' do
      it 'displays all nav links except Home' do
        visit root_path
        expect(page).to have_link('About')
        expect(page).to have_link('Portfolio')
        expect(page).to have_link('Blog')
        expect(page).not_to have_link('Home')
      end
    end

    describe 'StaticPages #about' do
      it 'displays all nav links except About' do
        visit about_path
        expect(page).to have_link('Home')
        expect(page).to have_link('Portfolio')
        expect(page).to have_link('Blog')
        expect(page).not_to have_link('About')
      end
    end

    describe 'Articles #index' do
      it 'displays all nav links except Blog' do
        visit blog_path
        expect(page).to have_link('About')
        expect(page).to have_link('Portfolio')
        expect(page).to have_link('Home')
        expect(page).not_to have_link('Blog')
      end
    end

    describe 'Projects #index' do
      it 'displays all nav links except Projects' do
        visit portfolio_path
        expect(page).to have_link('About')
        expect(page).to have_link('Blog')
        expect(page).to have_link('Home')
        expect(page).not_to have_link('Projects')
      end
    end
  end
end