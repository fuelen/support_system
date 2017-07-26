require 'rails_helper'

describe Manager::TicketsController, type: :controller do
  let!(:manager) { create :manager, password: 'password', username: 'test' }

  describe 'GET #index' do
    context 'unauthenticated' do
      before { get :index }
      it { expect(response).to redirect_to manager_root_path }
    end

    context 'authenticated' do
      before { sign_in manager, :manager }
      before { get :index }
      it { expect(response).to be_success }
    end
  end

  describe 'GET #show' do
    let!(:ticket) { create :ticket }

    context 'unauthenticated' do
      before { get :show, params: { reference: ticket.reference } }
      it { expect(response).to redirect_to manager_root_path }
    end

    context 'authenticated' do
      before { sign_in manager, :manager }

      context 'success' do
        before { get :show, params: { reference: ticket.reference } }

        it { expect(response).to be_success }
      end

      context 'not_found' do
        specify do
          expect { get :show, params: { reference: 0 } }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
