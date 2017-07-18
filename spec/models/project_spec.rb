require 'rails_helper'

describe Project do  
  context 'test' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:project)).to be_valid
    end
  end

  context 'validation' do
    describe 'name' do
      it 'must be present' do
        expect(FactoryGirl.build(:project, name: nil)).to be_invalid
      end
    end

    describe 'github_link' do
      it 'must be present' do
        expect(FactoryGirl.build(:project, github_link: nil)).to be_invalid
      end
    end

    describe 'site_link' do
      it 'must be present' do
        expect(FactoryGirl.build(:project, site_link: nil)).to be_invalid
      end
    end

    describe 'image' do
      it 'must be present' do
        expect(FactoryGirl.build(:project, image: nil)).to be_invalid
      end
    end

    describe 'description' do
      it 'must be present' do
        expect(FactoryGirl.build(:project, description: nil)).to be_invalid
      end
    end
  end
end