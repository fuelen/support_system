require 'rails_helper'

describe Customer::Message::CreateContract, type: :contract do
  let!(:properties) { %i[text] }
  subject { described_class.new(Struct.new(*properties).new) }

  it { is_expected.to validate_presence_of(:text) }
end
