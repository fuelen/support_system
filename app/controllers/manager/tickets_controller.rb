class Manager
  class TicketsController < BaseController
    before_action :authenticate_manager!

    def index
      run Ticket::Index
      if result['ticket_by_query'].present?
        return redirect_to [:manager, result['ticket_by_query']]
      end
      render concept(Ticket::Cell::Index, OpenStruct.new(
                                            contract_search: result['contract.search'],
                                            collection: result['collection'],
                                            current_view: result['current_view']
      ))
    end

    def show
      run Ticket::Show
      render concept(Ticket::Cell::Show, @model, contract_message: result['contract.message'])
    end

    def update
      run Ticket::Update do
        return redirect_to [:manager, @model]
      end
      render concept(Ticket::Cell::Show, @model, contract_message: result['contract.message'])
    end
  end
end
