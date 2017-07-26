module Manager::Session
  class CreateContract < Reform::Form
    property :username
    property :password, virtual: true

    validates :username, presence: true
    validates :password, presence: true

    validate :password_ok?

    def manager
      @manager ||= Manager.find_by(username: username)
    end

    private

    def password_ok?
      return if username.blank? || password.blank?
      return if manager&.authenticate(password)
      errors.add(:password, 'is incorrect')
    end
  end
end
