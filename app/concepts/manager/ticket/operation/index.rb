module Manager::Ticket
  class Index < Trailblazer::Operation
    ALLOWED_VIEWS = %w[unassigned opened on_hold closed].freeze
    DEFAULT_VIEW = 'unassigned'.freeze

    step :detect_view!
    step :fetch_collection!

    def detect_view!(options, params:, **)
      options['current_view'] = ALLOWED_VIEWS.include?(params[:view]) ? params[:view] : DEFAULT_VIEW
    end

    def fetch_collection!(options, current_view:, **)
      options['collection'] = ::Ticket.send(current_view)
    end
  end
end
