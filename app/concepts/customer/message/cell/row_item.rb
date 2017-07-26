module Customer::Message::Cell
  class RowItem < Trailblazer::Cell
    property :text
    property :created_at
    property :new_owner
    property :new_status

    def author_name
      model.author&.username || model.ticket.customer_name
    end

    def new_owner
      model.new_owner&.username
    end

    def new_status
      model.new_status&.name
    end
  end
end
