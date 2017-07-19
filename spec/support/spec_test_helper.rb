module SpecTestHelper
  def login_admin
    user = FactoryGirl.create(:user)
    session[:user_id] = user.id
  end
end