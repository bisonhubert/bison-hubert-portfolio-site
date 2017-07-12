require 'rails_helper'

describe Article, type: :model do
  context 'test' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:article)).to be_valid
    end
  end

  context 'validation' do
    describe 'title' do
      it 'must be present' do
        expect(FactoryGirl.build(:article, title: nil)).to be_invalid
      end

      it 'must contain at least 5 characters' do
        expect(FactoryGirl.build(:article, title: 'a' *4 )).to be_invalid
      end
    end

    describe 'text' do
      it 'must be present' do
        expect(FactoryGirl.build(:article, text: nil)).to be_invalid
      end
    end

    describe 'image' do
      it 'must be present' do
        expect(FactoryGirl.build(:article, image: nil)).to be_invalid
      end
    end

    describe 'summary' do
      it 'must be present' do
        expect(FactoryGirl.build(:article, summary: nil)).to be_invalid
      end

      it 'cannot exceed 140 characters' do
        expect(FactoryGirl.build(:article, summary: 'a' * 141)).to be_invalid
      end
    end
  end
end