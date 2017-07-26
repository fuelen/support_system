module Manager::Session::Cell
  class New < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper

    property :contract
  end
end
