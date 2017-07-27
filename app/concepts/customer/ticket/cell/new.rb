module Customer::Ticket::Cell
  class New < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::FormOptionsHelper

    def contract
      options[:contract]
    end

    def departments
      ::Rails.application.config.departments
    end
  end
end
