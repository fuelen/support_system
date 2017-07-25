module Customer::Ticket
  class Build < Trailblazer::Operation
    step Model(::Ticket, :new)
    step Contract::Build(constant: CreateContract)
  end
end
