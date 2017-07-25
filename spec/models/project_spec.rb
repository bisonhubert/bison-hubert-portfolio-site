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

  context 'callback' do
    describe '#full_url' do
      it 'adds http to site links before save' do
        project = FactoryGirl.create(:project)
        project.reload
        expect(project.site_link).to include("http")
        expect(project.github_link).to include("http")
      end
    end
  end
end