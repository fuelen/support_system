require 'rails_helper'

describe Manager::SessionsController, type: :controller do
  let!(:manager) { create :manager, password: 'password', username: 'test' }

  describe 'GET #new' do
    context 'unauthenticated' do
      before { get :new }
      it { expect(response).to be_success }
    end

    context 'authenticated' do
      before { sign_in manager, :manager }
      before { get :new }
      it { expect(response).to redirect_to manager_tickets_path }
    end
  end

  describe 'POST #create' do
    context 'unauthenticated' do
      context 'valid params' do
        before do
          post :create, params: {
            'manager' => {
              'username' => manager.username,
              'password' => 'password'
            }
          }
        end
        it { expect(response).to redirect_to manager_tickets_path }
        it { expect(signed_user(:manager)).to eq manager }
      end

      context 'invalid params' do
        before do
          post :create, params: {
            'manager' => {
              'email' => manager.username,
              'password' => 'iinvale'
            }
          }
        end
        it { expect(response).to be_success }
        it { expect(signed_user(:manager)).to be_blank }
      end
    end

    context 'authenticated' do
      before { sign_in manager, :manager }
      before { get :new }
      it { expect(response).to redirect_to manager_tickets_path }
    end
  end

  describe 'DELETE #destroy' do
    context 'unauthenticated' do
      before { delete :destroy }

      it { expect(response).to redirect_to manager_root_path }
      it { expect(signed_user(:manager)).to be_blank }
    end

    context 'authenticated' do
      before { sign_in manager, :manager }
      before { delete :destroy }

      it { expect(response).to redirect_to manager_root_path }
      it { expect(signed_user(:manager)).to be_blank }
    end
  end
end
