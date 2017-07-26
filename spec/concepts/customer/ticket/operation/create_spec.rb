require 'rails_helper'

describe Customer::Ticket::Create do
  let!(:status) { create :status, id: :waiting_for_staff_response }
  subject { described_class.(params) }
  let(:model) { subject['model'] }

  let(:params) do
    {
      ticket: {
        customer_name: 'Vasyan',
        customer_email: 'vasyan@example.com',
        body: 'body',
        subject: 'subject',
        department: Rails.application.config.departments.sample
      }
    }.with_indifferent_access
  end
  before { allow(HexReference).to receive(:generate).and_return('test-ref') }

  it { expect(model).to be_persisted }
  it { expect(model.status).to eq status }
  it { expect(model.reference).to eq 'test-ref' }
  it { expect(CustomerMailer.instance_method(:ticket_confirmation)).to be_delayed model.id }
end
