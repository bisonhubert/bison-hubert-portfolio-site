require 'rails_helper'

describe StaticPagesController do
  describe 'GET #home' do
    it 'returns a 200 response' do
      get :home
      expect(response.status).to eq(200)
    end

    it 'renders the :home view' do
      get :home
      expect(response).to render_template(:home)
    end
  end
  
  describe 'GET #about' do
    it 'returns a 200 response' do
      get :about
      expect(response.status).to eq(200)
    end

    it 'renders the :about view' do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe 'GET #resume' do
    it 'returns a 200 response' do
      get :resume
      expect(response.status).to eq(200)
    end

    it 'renders a PDF' do
      get :resume
      expect(response.content_type).to eq('application/pdf')
    end
  end

  describe 'GET #stattergories_die' do
    it 'returns a 200 response' do
      get :scattergories_die
      expect(response.status).to eq(200)
    end

    it 'renders the :scattergories_die view' do
      get :scattergories_die
      expect(response).to render_template(:scattergories_die)
    end
  end

  describe 'GET #under_construction' do
    it 'returns a 200 response' do
      get :under_construction
      expect(response.status).to eq(200)
    end

    it 'renders the :under_construction view' do
      get :under_construction
      expect(response).to render_template(:under_construction)
    end
  end
end