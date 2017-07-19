require 'rails_helper'

describe ArticlesController do
  include SpecTestHelper

  let(:article) { FactoryGirl.create(:article) }

  context 'when a user is not logged in' do
    describe 'GET #index' do
      before :each do
        get :index
      end

      it 'returns a 200 response and renders the :index template' do
        expect(response.status).to eq(200)
        expect(response).to render_template(:index)
      end

      it 'populates an array of articles' do
        expect(assigns(:articles)).to eq([article])
      end
    end

    describe 'GET #show' do
      before :each do
        get :show, params: { id: article.id }
      end

      it 'returns a 200 response and renders the :show template' do
        expect(response.status).to eq(200)
        expect(response).to render_template :show
      end

      it 'renders an article' do
        expect(assigns(:article)).to eq(article)
      end
    end

    describe 'GET #new' do
      it 'returns a 302 response and redirects to the home page' do
        get :new
        expect(response.status).to eq(302)
        expect(response).to redirect_to root_url
      end
    end
    
    describe 'GET #edit' do  
      it 'returns a 302 response and redirects to the home page' do
        get :edit, params: { id: article.id }
        expect(response.status).to eq(302)
        expect(response).to redirect_to root_url
      end
    end
  end  

  context 'when a user is logged in' do
    before :each do
      login_admin
    end

    describe 'GET #show' do 
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #edit' do
      it 'renders the edit template' do
        get :edit, params: { id: article.id }
        expect(response).to render_template(:edit)
      end
    end

    describe 'POST #create' do

    end

    describe 'PATCH #update' do

    end

    describe 'DELETE #destroy' do

    end
  end
end