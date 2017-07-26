class Manager
  class TicketsController < BaseController
    before_action :authenticate_manager!

    def index
      run Ticket::Index
      render concept(Ticket::Cell::Index, OpenStruct.new(
                                            collection: result['collection'],
                                            current_view: result['current_view']
      ))
    end
  end
end
