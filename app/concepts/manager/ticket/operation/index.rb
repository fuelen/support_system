module Manager::Ticket
  class Index < Trailblazer::Operation
    ALLOWED_VIEWS = %w[unassigned opened on_hold closed].freeze
    DEFAULT_VIEW = 'unassigned'.freeze

    step :detect_view!
    step :build_search_form!
    step :fetch_collection!
    step :search!

    def detect_view!(options, params:, **)
      options['current_view'] = ALLOWED_VIEWS.include?(params[:view]) ? params[:view] : DEFAULT_VIEW
    end

    def build_search_form!(options, params:, current_view:, **)
      model = OpenStruct.new(query: params[:query], view: current_view)
      options['contract.search'] = SearchContract.new(model)
    end

    def fetch_collection!(options, current_view:, **)
      options['collection'] = ::Ticket.send(current_view).includes(:status)
    end

    def search!(options, collection:, **)
      query = options['contract.search'].query
      return if query.blank?
      options['ticket_by_query'] = ::Ticket.find_by(reference: query)
      return if options['ticket_by_query'].present?
      options['collection'] = collection.search(query, in: :subject)
    end
  end
end
