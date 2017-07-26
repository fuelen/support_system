module Manager::Message
  class CreateContract < Reform::Form
    property :text
    property :new_owner_id, prepopulator: ->(options) { self.new_owner_id = options[:current_manager].id }
    property :new_status_id, prepopulator: ->(_options) { self.new_status_id = 'waiting_for_customer' }

    validates :text, presence: true
    validate :existence_of_new_owner
    validate :existence_of_new_status

    def existence_of_new_owner
      return if new_owner_id.blank?
      errors.add(:new_owner_id, 'does not exists') unless Manager.exists?(new_owner_id)
    end

    def existence_of_new_status
      return if new_status_id.blank?
      errors.add(:new_status_id, 'does not exists') unless Status.exists?(new_status_id)
    end
  end
end
