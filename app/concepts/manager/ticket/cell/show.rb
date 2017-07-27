module Manager::Ticket
  class Cell
    class Show < Customer::Ticket::Cell::Show
      # overwrite message_form because we want to use another url
      def message_form
        OpenStruct.new(
          contract: options['contract.message'],
          url: [:manager, model]
        )
      end
    end
  end
end
