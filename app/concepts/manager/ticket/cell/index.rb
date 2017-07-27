module Manager::Ticket
  class Cell
    class Index < Trailblazer::Cell
      property :collection
      property :current_view

      def contract_search
        model['contract.search']
      end

      def views
        Manager::Ticket::Index::ALLOWED_VIEWS.map do |view|
          if view == current_view
            view.humanize
          else
            link_to view.humanize, manager_tickets_path(view: view)
          end
        end.join(' ')
      end
    end
  end
end
