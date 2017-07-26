module Customer::Ticket
  class Update < Trailblazer::Operation
    step Nested(Show)
    step Contract::Validate(key: 'message', name: 'message')
    step :sync_message!
    step :set_statuses!
    step :attach_ticket_to_message!
    step Wrap ->(*, &block) { ActiveRecord::Base.transaction do block.call end } {
      step :save_message!
      step :save_ticket!
    }

    def sync_message!(options, *)
      options['message'] = options['contract.message'].sync
    end

    def set_statuses!(_options, message:, model:, **)
      return true if model.status_id == 'waiting_for_staff_response'
      model.status_id = message.new_status_id = 'waiting_for_staff_response'
    end

    def attach_ticket_to_message!(_options, model:, message:, **)
      message.ticket = model
    end

    def save_message!(_options, message:, **)
      message.save
    end

    def save_ticket!(_options, model:, **)
      model.save
    end
  end
end
