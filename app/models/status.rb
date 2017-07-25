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

class Status < ApplicationRecord
  enum kind: %i[opened on_hold closed]
end
