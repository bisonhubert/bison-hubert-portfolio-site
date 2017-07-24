require 'rails_helper'

describe SessionsController do
  let(:user) { FactoryGirl.create(:user) }
  
  describe 'POST #create' do
    context 'when password is invalid' do
      it 'renders the page with error' do
        post :create, params: { 
          session: { 
            email: user.email, 
            password: nil 
          } 
        }
        expect(response).to render_template(:new)
        expect(flash[:danger]).to eq('Invalid email/password combination')
      end
    end

    context 'when email and password are valid' do
      it 'sets the user in the session and redirects to root url' do
        post :create, params: { 
          session: { 
            email: user.email, 
            password: user.password 
          } 
        }
        
        expect(response.status).to eq(302)
        expect(response).to redirect_to(home_path)
        expect(controller.current_user).to eq(user)
      end
    end
  end
end