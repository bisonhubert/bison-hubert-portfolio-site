require 'rails_helper'

describe User do
  context 'test' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end

  context 'validation' do
    describe 'name' do
      it 'must be present' do
        expect(FactoryGirl.build(:user, name: nil)).to be_invalid
      end

      it 'cannot exceed 50 characters' do
        expect(FactoryGirl.build(:user, name: 'a' * 51)).to be_invalid
      end
    end

    describe 'email' do
      it 'must be present' do
        expect(FactoryGirl.build(:user, email: nil)).to be_invalid
      end

      it 'must be properly formatted' do
        expect(FactoryGirl.build(:user, email: 'a')).to be_invalid
        expect(FactoryGirl.build(:user, email: '.com')).to be_invalid
        expect(FactoryGirl.build(:user, email: '@.com')).to be_invalid
        expect(FactoryGirl.build(:user, email: 'a@.com')).to be_invalid
        expect(FactoryGirl.build(:user, email: 'a@b.com')).to be_valid
      end

      it 'must be unique' do
        FactoryGirl.create(:user, email: 'a@b.com')
        expect(FactoryGirl.build(:user, email: 'a@b.com')).to be_invalid
      end

      it 'cannot exceed 255 characters' do
        valid_email = 'a' * 249 + '@b.com'
        expect(FactoryGirl.build(:user, email: valid_email)).to be_valid
        invalid_email = 'a' + valid_email
        expect(FactoryGirl.build(:user, email: invalid_email)).to be_invalid
      end
    end

    describe 'password' do
      it 'must be present' do
        expect(FactoryGirl.build(:user, password: nil)).to be_invalid
      end

      it 'must contain at least 6 characters' do
        expect(FactoryGirl.build(:user, password: 'a' * 5)).to be_invalid
      end
    end
  end

  context 'callback' do
    describe 'email' do
      it 'is stored as downcase' do
        mixed_case_email = 'a@B.cOm'
        user = FactoryGirl.create(:user, email: mixed_case_email)
        expect(user.email).to eq(mixed_case_email.downcase)
      end
    end
  end
end