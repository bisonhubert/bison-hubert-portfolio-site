require 'rails_helper'

describe ProjectsController do
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

      it 'populates an array of projects' do
        project = FactoryGirl.create(:project)
        expect(assigns(:projects)).to eq([project])
      end
    end

    describe 'GET #show' do
      before :each do
        @project = FactoryGirl.create(:project)
        get :show, params: { id: @project }
      end

      it 'returns a 200 response' do
        expect(response.status).to eq(200)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end

      it 'renders a project' do
        expect(assigns(:project)).to eq(@project)
      end
    end

    describe 'GET #new' do
      before :each do
        get :new
      end

      it 'returns a 302 response' do
        expect(response.status).to eq(302)
      end

      it 'redirects to root_url' do
        expect(response).to redirect_to(root_url)
      end
    end
    
    describe 'GET #edit' do
      before :each do
        project = FactoryGirl.create(:project)
        get :edit, params: { id: project }
      end

      it 'returns a 302 response' do
        expect(response.status).to eq(302)
      end

      it 'redirects to root_url' do
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
        project = FactoryGirl.create(:project)
        get :edit, params: { id: project }
        expect(response).to render_template(:edit)
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        before :each do
          @project = FactoryGirl.build(:project)
        end

        it 'creates a new project' do
          expect {          
            post :create, params: { project: FactoryGirl.attributes_for(:project) }
          }.to change(Project, :count).by(1)
        end

        it 'redirects to project_path(project)' do
          post :create, params: { project: FactoryGirl.attributes_for(:project) }
          expect(response).to redirect_to(project_path(assigns(:project)))
        end
      end
        
      context 'with invalid attributes' do
        it 'renders :new template' do
          post :create, params: { project: FactoryGirl.attributes_for(:project, name: nil) }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PATCH #update' do
      before :each do
        @project = FactoryGirl.create(:project)
      end

      context 'with valid attributes' do
        before :each do
          patch :update, params: { id: @project, project: { name: 'New Title' } }
        end

        it 'updates an existing project' do
          @project.reload
          expect(@project.name).to match('New Title')
        end

        it 'redirects to project_path(project)' do
          expect(response).to redirect_to(project_path(assigns[:project]))
        end
      end

      context 'with invalid attributes' do
        it 'renders :edit template' do
          patch :update, params: { id: @project, project: { name: nil } }
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @project = FactoryGirl.create(:project)
      end

      it 'removes project from database' do
        expect(Project.count).to eq(1)
        delete :destroy, params: { id: @project }
        expect(Project.count).to eq(0)
      end

      it 'redirects to blog_path' do
        delete :destroy, params: { id: @project }
        expect(response).to redirect_to(portfolio_path)
      end
    end
  end
end
