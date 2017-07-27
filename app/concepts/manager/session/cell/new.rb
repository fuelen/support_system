module Manager::Session::Cell
  class New < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper

    def contract
      options[:contract]
    end
  end
end
