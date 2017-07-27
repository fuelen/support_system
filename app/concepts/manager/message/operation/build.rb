require_dependency Rails.root.join('app/concepts/manager/message/contract/create')

module Manager::Message
  class Build < Trailblazer::Operation
    step Model(::Message, :new)
    step Contract::Build(constant: CreateContract)
    step :prepopulate!

    def prepopulate!(options, current_manager:, **)
      options['contract.default'].prepopulate!(current_manager: current_manager)
    end
  end
end
