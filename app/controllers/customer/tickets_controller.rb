module Customer
  class TicketsController < BaseController
    def new
      run Ticket::Build
      render concept(Ticket::Cell::New, OpenStruct.new(contract: @form))
    end

    def create
      run Ticket::Create do
        return redirect_to @model
      end
      render concept(Ticket::Cell::New, OpenStruct.new(contract: @form))
    end

    def show
      run Ticket::Show
      render concept(Ticket::Cell::Show, @model)
    end
  end
end
