require 'rails_helper'

describe ArticlesController do
  include SpecTestHelper

  context 'when user is logged out' do
    describe 'GET #index' do
      before :each do
        get :index
      end

      it 'returns a 200 response' do
        expect(response.status).to eq(200)
      end

      it 'renders the :index template' do
        expect(response).to render_template(:index)
      end

      it 'populates an array of articles' do
        article = FactoryGirl.create(:article)
        expect(assigns(:articles)).to eq([article])
      end
    end

    describe 'GET #show' do
      before :each do
        @article = FactoryGirl.create(:article)
        get :show, params: { id: @article }
      end

      it 'returns a 200 response' do
        expect(response.status).to eq(200)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end

      it 'renders an article' do
        expect(assigns(:article)).to eq(@article)
      end
    end

    describe 'GET #new' do
      before :each do
        get :new
      end

      it 'returns a 302 response' do
        expect(response.status).to eq(302)
      end

      it 'redirects to home_path' do
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'GET #edit' do
      before :each do
        article = FactoryGirl.create(:article)
        get :edit, params: { id: article }
      end

      it 'returns a 302 response' do
        expect(response.status).to eq(302)
      end

      it 'redirects to home_path' do
        expect(response).to redirect_to(root_url)
      end
    end
  end  

  context 'when user is logged in' do
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
        article = FactoryGirl.create(:article)
        get :edit, params: { id: article }
        expect(response).to render_template(:edit)
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        before :each do
          @article = FactoryGirl.build(:article)
        end

        it 'creates a new article' do
          expect {          
            post :create, params: { article: FactoryGirl.attributes_for(:article) }
          }.to change(Article, :count).by(1)
        end

        it 'redirects to article_path(article)' do
          post :create, params: { article: FactoryGirl.attributes_for(:article) }
          expect(response).to redirect_to(article_path(assigns(:article)))
        end
      end
        
      context 'with invalid attributes' do
        it 'renders :new template' do
          post :create, params: { article: FactoryGirl.attributes_for(:article, title: nil) }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PATCH #update' do
      before :each do
        @article = FactoryGirl.create(:article)
      end

      context 'with valid attributes' do
        before :each do
          patch :update, params: { id: @article, article: { title: 'New Title' } }
        end

        it 'updates an existing article' do
          @article.reload
          expect(@article.title).to match('New Title')
        end

        it 'redirects to article_path(article)' do
          expect(response).to redirect_to(article_path(assigns[:article]))
        end
      end

      context 'with invalid attributes' do
        it 'renders :edit template' do
          patch :update, params: { id: @article, article: { title: nil } }
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @article = FactoryGirl.create(:article)
      end

      it 'removes article from database' do
        expect(Article.count).to eq(1)
        delete :destroy, params: { id: @article }
        expect(Article.count).to eq(0)
      end

      it 'redirects to blog_path' do
        delete :destroy, params: { id: @article }
        expect(response).to redirect_to(blog_path)
      end
    end
  end
end