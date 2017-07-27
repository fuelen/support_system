class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticator
    @authenticator ||= Authenticator.new(request.env['warden'])
  end

  def render_concept(concept_class, *args)
    options = args.map { |arg| [arg, result[arg]] }.to_h.merge(
      contract: @form
    )
    model = @model || OpenStruct.new(options)
    render concept(concept_class, model, model.nil? ? {} : options)
  end
end
