class Manager
  class TicketsController < BaseController
    before_action :authenticate_manager!

    def index
      run Ticket::Index
      if result['ticket_by_query'].present?
        return redirect_to [:manager, result['ticket_by_query']]
      end
      render_concept(Ticket::Cell::Index, 'contract.search', 'collection', 'current_view')
    end

    def show
      run Ticket::Show
      render_concept(Ticket::Cell::Show, 'contract.message')
    end

    def update
      run Ticket::Update do
        return redirect_to [:manager, @model]
      end
      render_concept(Ticket::Cell::Show, 'contract.message')
    end
  end
end
