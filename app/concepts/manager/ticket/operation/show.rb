module Manager::Ticket
  class Show < Trailblazer::Operation
    step :find_ticket!

    def find_ticket!(options, params:, **)
      # let handle not_found by rails
      options['model'] = ::Ticket.find_by!(reference: params[:reference])
    end
  end
end
