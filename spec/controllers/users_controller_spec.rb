require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user, password: '123123123', password_confirmation: '123123123') }
  
  describe 'GET #new' do
    before { get :new }

    it { is_expected.to render_template(:new) }
    it { is_expected.to respond_with :success }
  end

  describe 'POST #create' do
    
    context 'with valid params' do
      before do
        post :create, user: attributes_for(:user)
      end

      it { expect(response).to redirect_to(root_path) }
    end

    context 'with invalid params' do
      before { post :create, user: attributes_for(:user, email: '')}

      it { is_expected.to render_template(:new) }
      it { expect(controller.current_user).to be_nil }
    end
  end
end