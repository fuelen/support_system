module Customer::Ticket
  class Create < Trailblazer::Operation
    step Nested(Build)
    step Contract::Validate(key: 'ticket')
    step Contract::Persist(method: :sync)
    step :set_status!
    step :generate_reference_and_persist!
    step :notify_customer!

    def set_status!(_options, model:, **)
      model.status = Status.find(:waiting_for_staff_response)
    end

    def generate_reference_and_persist!(_options, model:, **)
      model.reference = HexReference.generate
      model.save
    rescue ActiveRecord::RecordNotUnique
      retry
    end

    def notify_customer!(_options, model:, **)
      CustomerMailer.delay.ticket_confirmation(model.id)
    end
  end
end
