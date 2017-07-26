module Manager::Message
  class Cell
    class New < Trailblazer::Cell
      include SimpleForm::ActionViewExtensions::FormHelper
      include ActionView::Helpers::FormOptionsHelper

      property :contract
      property :url

      def owners
        Manager.pluck(:username, :id)
      end

      def statuses
        Status.pluck(:name, :id)
      end
    end
  end
end
