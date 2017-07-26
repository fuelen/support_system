module Manager::Ticket
  class Cell
    class RowItem < Trailblazer::Cell
      property :reference
      property :subject
      property :updated_at
      property :customer_name
      property :customer_email

      def owner
        model.owner&.username
      end

      def status
        model.status.name
      end
    end
  end
end
