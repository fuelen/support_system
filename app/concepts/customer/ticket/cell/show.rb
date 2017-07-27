module Customer::Ticket::Cell
  class Show < Trailblazer::Cell
    property :reference
    property :subject
    property :body
    property :department
    property :customer_name
    property :customer_email

    def status
      model.status.name
    end

    def message_form
      OpenStruct.new(
        contract: options['contract.message'],
        url: model
      )
    end

    def messages
      model.messages.includes(:author, :new_status, :new_owner).order(created_at: :desc)
    end
  end
end
