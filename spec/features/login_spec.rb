require 'rails_helper'

describe 'Login' do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  context 'when password is invalid' do
    it 'renders signin form and flashes message' do
      visit login_path
      expect(page).to have_title('Log in')
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'fakepassword'
      click_button('Login')
      expect(page).to have_title('Log in')
      expect(page).to have_text('Invalid email/password combination')
    end
  end

  context 'when password is valid' do
    it 'logs in user and redirects to blog index' do
      visit login_path
      expect(page).to have_title('Log in')
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button('Login')
      expect(page).to have_title('Blog')
    end
  end
end