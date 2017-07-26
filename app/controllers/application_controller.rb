class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticator
    @authenticator ||= Authenticator.new(request.env['warden'])
  end
end
