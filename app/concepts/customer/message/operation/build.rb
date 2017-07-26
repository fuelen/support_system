require_dependency 'app/concepts/customer/message/contract/create'

module Customer::Message
  class Build < Trailblazer::Operation
    step Model(::Message, :new)
    step Contract::Build(constant: CreateContract)
  end
end
