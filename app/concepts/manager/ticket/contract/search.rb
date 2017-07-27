module Manager::Ticket
  class SearchContract < Reform::Form
    property :query
    property :view
  end
end
