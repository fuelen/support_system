require 'rails_helper'

describe Customer::Ticket::CreateContract, type: :contract do
  let!(:properties) { %i[customer_name customer_email subject department body] }
  subject { described_class.new(Struct.new(*properties).new) }

  it { is_expected.to validate_presence_of(:customer_name) }
  it { is_expected.to validate_presence_of(:customer_email) }
  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:department) }
  it { is_expected.to validate_inclusion_of(:department).in_array(Rails.application.config.departments) }
  it { is_expected.to allow_values('email+1@gmail.com', 'arch.l1nux@gov.ua.ua.ua').for(:customer_email) }
  it { is_expected.not_to allow_values('email+1@gmailcom', 'arch.linux[at]gov.ua').for(:customer_email) }
end
