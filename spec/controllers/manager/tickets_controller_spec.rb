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

  describe 'PUT #update' do
    let!(:ticket) { create :ticket }
    let!(:status) { create :status, id: :waiting_for_customer }

    context 'unauthenticated' do
      before { put :update, params: { reference: ticket.reference } }
      it { expect(response).to redirect_to manager_root_path }
    end

    context 'authenticated' do
      before { sign_in manager, :manager }

      context 'success' do
        let(:params) do
          {
            reference: ticket.reference,
            message: {
              text: 'test'
            }
          }
        end

        before { put :update, params: params }

        it { expect(response).to redirect_to [:manager, Ticket.last] }
      end

      context 'invalid params' do
        let!(:status) { create :status, id: :waiting_for_staff_response }
        let(:params) { { reference: ticket.reference } }

        before { put :update, params: params }

        it { expect(response).to be_success }
      end
    end
  end
end
