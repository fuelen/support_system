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

FactoryGirl.define do
  factory :status do
    id 'on_hold'
    name 'On Hold'
    kind :on_hold
  end
end
