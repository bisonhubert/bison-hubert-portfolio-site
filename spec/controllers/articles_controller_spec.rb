require 'rails_helper'

describe ArticlesController do
  describe 'GET #index' do

    before :each do
     get :index
    end

    it 'returns a 200 response' do
      expect(response.status).to eq(200)
    end

    it 'renders the :index view' do
      expect(response).to render_template(:index)
    end

    it 'populates an array of articles' do
      article = FactoryGirl.create(:article)
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe 'GET #show' do
    let(:article) { FactoryGirl.create(:article) }

    before :each do
      get :show, params: { id: article.id }
    end

    it 'returns a 200 response' do
      expect(response.status).to eq(200)
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end

    it 'renders an article' do
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'GET #new' do
    context 'when a user is not logged in' do
      it 'returns a 302 response' do
        get :new
        expect(response.status).to eq(302)
      end

      it 'redirects to the home page' do
        get :new
        expect(response).to redirect_to root_url
      end
    end
  end

  describe 'GET #edit' do
    let(:article) { FactoryGirl.create(:article) }

    before :each do
      get :edit, params: { id: article.id }
    end

    context 'when a user is not logged in' do
      it 'returns a 302 response' do
        expect(response.status).to eq(302)
      end

      it 'redirects to the home page' do
        expect(response).to redirect_to root_url
      end
    end
  end
end