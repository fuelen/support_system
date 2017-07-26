require_dependency 'app/concepts/customer/message/operation/build'

module Customer::Ticket
  class Show < Trailblazer::Operation
    step :find_ticket!
    step Nested(::Customer::Message::Build, output: lambda do |_options, mutable_data:, **|
      {
        'contract.message' => mutable_data['contract.default'],
        'message' => mutable_data['model']
      }
    end)

    def find_ticket!(options, params:, **)
      # let handle not_found by rails
      options['model'] = ::Ticket.find_by!(reference: params[:reference])
    end
  end
end
