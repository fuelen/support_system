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

FactoryGirl.define do
  factory :ticket do
    customer_name 'jonh'
    customer_email 'john@doe.com'
    department 'default'
    subject 'I have a problem'
    body 'example'
    status
    sequence(:reference) { |n| "ABC-4F-ABC-8D-#{n}" }
  end
end
