module Customer
  class TicketsController < BaseController
    def new
      run Ticket::Build
      render_concept(Ticket::Cell::New)
    end

    def create
      run Ticket::Create do
        return redirect_to @model
      end
      render_concept(Ticket::Cell::New)
    end

    def show
      run Ticket::Show
      render_concept(Ticket::Cell::Show, 'contract.message')
    end

    def update
      run Ticket::Update do
        return redirect_to @model
      end
      render_concept(Ticket::Cell::Show, 'contract.message')
    end
  end
end
