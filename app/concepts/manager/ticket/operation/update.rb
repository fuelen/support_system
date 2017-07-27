module Manager::Ticket
  class Update < Trailblazer::Operation
    step Nested(Show)
    step Contract::Validate(key: 'message', name: 'message')
    step :sync_message!
    step :attach_ticket_to_message!
    step :attach_author_to_message!
    success :set_new_owner!
    success :set_new_status!
    step Wrap ->(*, &block) { ActiveRecord::Base.transaction do block.call end } {
      step :save_message!
      step :save_ticket!
    }
    step :send_notification!

    def sync_message!(options, *)
      options['message'] = options['contract.message'].sync
    end

    def attach_ticket_to_message!(_options, model:, message:, **)
      message.ticket = model
    end

    def attach_author_to_message!(_options, current_manager:, message:, **)
      message.author = current_manager
    end

    def set_new_owner!(_options, message:, model:, **)
      return message.new_owner_id = nil if model.owner_id == message.new_owner_id
      model.owner_id = message.new_owner_id
    end

    def set_new_status!(_options, message:, model:, **)
      return message.new_status_id = nil if model.status_id == message.new_status_id
      model.status_id = message.new_status_id
    end

    def save_message!(_options, message:, **)
      message.save
    end

    def save_ticket!(_options, model:, **)
      model.save
    end

    def send_notification!(_options, message:, **)
      CustomerMailer.delay.new_reply(message.id)
    end
  end
end
