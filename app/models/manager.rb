# == Schema Information
#
# Table name: managers
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_managers_on_username  (username) UNIQUE
#

class Manager < ApplicationRecord
  has_secure_password
end
