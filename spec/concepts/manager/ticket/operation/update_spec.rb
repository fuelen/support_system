require 'rails_helper'

describe Manager::Ticket::Update do
  let!(:manager1) { create :manager }
  let!(:manager2) { create :manager }
  let!(:ticket)   { create :ticket, status: current_status, owner: manager1 }
  let!(:new_status)     { create :status, id: :on_hold }
  let!(:current_status) { create :status, id: :waiting_for_staff_response }
  let(:operation) { described_class.(params, current_manager: manager1) }

  let(:params) do
    {
      reference: ticket.reference,
      message: {
        text: 'test text',
        new_owner_id: manager2.id,
        new_status_id: new_status.id
      }
    }.with_indifferent_access
  end

  it { expect { operation }.to change(Message, :count).by(1) }
  it { expect { operation }.to change { ticket.reload.status_id }.from(current_status.id).to(new_status.id) }
  it { expect(operation['message'].new_status_id).to eq new_status.id }
  it { expect(operation['message'].new_owner_id).to eq manager2.id }
  it { expect(operation['message'].author_id).to eq manager1.id }
  it { expect(CustomerMailer.instance_method(:new_reply)).to be_delayed operation['message'].id }
end
