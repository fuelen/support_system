module Manager::Session
  class Build < Trailblazer::Operation
    step Model(::Manager, :new)
    step Contract::Build(constant: CreateContract)
  end
end
