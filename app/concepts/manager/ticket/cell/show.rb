module Manager::Ticket
  class Cell
    class Show < Trailblazer::Cell
      property :reference
      property :subject
      property :body
      property :customer_name
      property :customer_email
      property :department

      def status
        model.status.name
      end
    end
  end
end
