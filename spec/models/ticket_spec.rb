# == Schema Information
#
# Table name: tickets
#
#  id             :integer          not null, primary key
#  customer_name  :string(255)      not null
#  customer_email :string(255)      not null
#  department     :string(255)      not null
#  subject        :string(255)      not null
#  body           :text(65535)      not null
#  owner_id       :integer
#  status_id      :string(255)      not null
#  reference      :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  fk_rails_7868b69687         (status_id)
#  fk_rails_939b990649         (owner_id)
#  index_tickets_on_reference  (reference) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => managers.id)
#  fk_rails_...  (status_id => statuses.id)
#

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { is_expected.to belong_to(:status) }
  it { is_expected.to belong_to(:owner).class_name('Manager') }

  describe 'status scopes' do
    let!(:manager)        { create :manager }

    let!(:opened_status)  { create :status, kind: :opened }
    let!(:on_hold_status) { create :status, kind: :on_hold }
    let!(:closed_status)  { create :status, kind: :closed }

    let!(:opened_unassigned_ticket) { create :ticket, status: opened_status, owner: nil }
    let!(:opened_assigned_ticket)   { create :ticket, status: opened_status, owner: manager }

    let!(:on_hold_unassigned_ticket) { create :ticket, status: on_hold_status, owner: nil }
    let!(:on_hold_assigned_ticket)   { create :ticket, status: on_hold_status, owner: manager }

    let!(:closed_unassigned_ticket) { create :ticket, status: closed_status, owner: nil }
    let!(:closed_assigned_ticket)   { create :ticket, status: closed_status, owner: manager }

    specify '#opened' do
      expect(described_class.opened).to contain_exactly opened_assigned_ticket
    end

    specify '#closed' do
      expect(described_class.closed).to contain_exactly closed_assigned_ticket
    end

    specify '#on_hold' do
      expect(described_class.on_hold).to contain_exactly on_hold_assigned_ticket
    end
  end
end
