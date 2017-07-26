module Customer::Message::Cell
  class New < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper

    property :contract
    property :url
  end
end
