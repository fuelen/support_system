module Manager::Ticket
  class Cell
    class SearchForm < Trailblazer::Cell
      include SimpleForm::ActionViewExtensions::FormHelper

      def contract
        options[:contract]
      end

      def url
        manager_tickets_path
      end
    end
  end
end
