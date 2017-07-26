module Customer::Message
  class CreateContract < Reform::Form
    property :text

    validates :text, presence: true
  end
end
