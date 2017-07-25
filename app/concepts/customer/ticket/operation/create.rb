module Customer::Ticket
  class Create < Trailblazer::Operation
    step Nested(Build)
    step Contract::Validate(key: 'ticket')
    step Contract::Persist(method: :sync)
    step :set_status!
    # step :set_reference!
    step :persist!

    def set_status!(_options, model:, **)
      model.status = Status.find(:waiting_for_staff_response)
    end

    def set_reference!(_options, model:, **)
    end

    def persist!(_options, model:, **)
      model.reference = HexReference.generate
      model.save
    rescue ActiveRecord::RecordNotUnique
      retry
    end
  end
end
