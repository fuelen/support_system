# == Schema Information
#
# Table name: statuses
#
#  id         :string(255)      not null, primary key
#  name       :string(255)      not null
#  kind       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_statuses_on_name  (name) UNIQUE
#

require 'rails_helper'

RSpec.describe Status, type: :model do
  it { is_expected.to define_enum_for(:kind).with(%i[opened on_hold closed]) }
end
