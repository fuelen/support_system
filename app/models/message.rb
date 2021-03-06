# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  ticket_id     :integer          not null
#  text          :text(65535)      not null
#  author_id     :integer
#  new_status_id :string(255)
#  new_owner_id  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  fk_rails_1a0b99fe7e  (ticket_id)
#  fk_rails_6fcc381042  (new_owner_id)
#  fk_rails_995937c106  (author_id)
#  fk_rails_deb6472fa9  (new_status_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => managers.id)
#  fk_rails_...  (new_owner_id => managers.id)
#  fk_rails_...  (new_status_id => statuses.id)
#  fk_rails_...  (ticket_id => tickets.id)
#

class Message < ApplicationRecord
  belongs_to :ticket
  belongs_to :author,     class_name: 'Manager', optional: true
  belongs_to :new_owner,  class_name: 'Manager', optional: true
  belongs_to :new_status, class_name: 'Status',  optional: true
end
