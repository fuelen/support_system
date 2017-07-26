require 'rails_helper'

describe HexReference do
  describe '#generate' do
    it { expect(described_class.generate).to match(/\A([A-Z]{3}-\h{2}-){2}[A-Z]{3}\z/) }
  end
end
