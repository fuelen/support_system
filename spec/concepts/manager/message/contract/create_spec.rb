require 'rails_helper'

describe Manager::Message::CreateContract, type: :contract do
  let!(:properties) { %i[text new_owner_id new_status_id] }
  subject { described_class.new(Struct.new(*properties).new) }
  let!(:manager) { create :manager }
  let!(:status) { create :status }

  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to allow_values(manager.id).for(:new_owner_id) }
  it { is_expected.not_to allow_values('other id').for(:new_owner_id).with_message('does not exists') }
  it { is_expected.to allow_values(status.id).for(:new_status_id) }
  it { is_expected.not_to allow_values('other id').for(:new_status_id).with_message('does not exists') }

  describe 'prepopulation' do
    let(:options) do
      {
        current_manager: double(:current_manager, id: 999)
      }
    end
    before { subject.prepopulate!(options) }

    it { expect(subject.new_owner_id).to eq 999 }
    it { expect(subject.new_status_id).to eq 'waiting_for_customer' }
  end
end
