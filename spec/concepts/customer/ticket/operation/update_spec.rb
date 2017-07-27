require 'rails_helper'

describe Customer::Ticket::Update do
  let!(:new_status)     { create :status, id: :waiting_for_staff_response }
  let!(:current_status) { create :status, id: :on_hold }
  let!(:ticket) { create :ticket, status: current_status }
  let(:operation) { described_class.(params) }

  let(:params) do
    {
      reference: ticket.reference,
      message: {
        text: 'test text'
      }
    }.with_indifferent_access
  end

  it { expect { operation }.to change(Message, :count).by(1) }
  it { expect { operation }.to change { ticket.reload.status_id }.from(current_status.id).to(new_status.id) }
  it { expect(operation['message'].new_status_id).to eq new_status.id }
  it { expect(operation['message'].new_owner_id).to eq nil }
  it { expect(operation['message'].author_id).to eq nil }
end
