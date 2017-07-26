require 'rails_helper'

RSpec.describe Customer::TicketsController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it { expect(response).to be_success }
  end

  describe 'POST #create' do
    context 'success' do
      let!(:status) { create :status, id: :waiting_for_staff_response }
      let(:params) do
        {
          ticket: {
            customer_name: 'Vasyan',
            customer_email: 'a@a.com',
            subject: 'test',
            body: 'test',
            department: 'Financial'
          }
        }
      end

      before { post :create, params: params }

      it { expect(response).to redirect_to Ticket.last }
    end

    context 'invalid params' do
      let!(:status) { create :status, id: :waiting_for_staff_response }
      let(:params) do
        {
          ticket: {
          }
        }
      end

      before { post :create, params: params }

      it { expect(response).to be_success }
    end
  end

  describe 'GET #show' do
    let!(:ticket) { create :ticket }

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
