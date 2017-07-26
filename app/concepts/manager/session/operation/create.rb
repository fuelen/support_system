module Manager::Session
  class Create < Trailblazer::Operation
    step Nested(Build)
    step self::Contract::Validate(key: 'manager')
    step :apply_found_model!

    def apply_found_model!(options, *)
      options['model'] = options['contract.default'].manager
    end
  end
end
