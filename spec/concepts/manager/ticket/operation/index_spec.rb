require 'rails_helper'

describe Manager::Ticket::Index do
  subject { described_class.(params) }

  context 'with selected view' do
    let(:params) do
      {
        view: 'opened'
      }.with_indifferent_access
    end

    it { expect(subject['current_view']).to eq 'opened' }
  end

  context 'with default view' do
    let(:params) { {} }

    it { expect(subject['current_view']).to eq 'unassigned' }
  end
end
