module Customer::Ticket
  class CreateContract < Reform::Form
    VALID_EMAIL_REGEX = /\A[a-z\d_\-.+]+@([a-z\d\-.]+\.)+[a-z]+\z/i

    property :customer_name
    property :customer_email
    property :subject
    property :department
    property :body

    validates :customer_name,  presence: true
    validates :customer_email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :subject,        presence: true
    validates :body,           presence: true
    validates :department,     presence: true, inclusion: { in: Rails.application.config.departments }
  end
end
