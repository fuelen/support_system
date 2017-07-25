module Customer::Ticket
  class Show < Trailblazer::Operation
    step :find_ticket!

    def find_ticket!(options, params:, **)
      options['model'] = ::Ticket.find_by(reference: params[:reference])
    end
  end
end
