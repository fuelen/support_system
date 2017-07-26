# required by warden

class UnauthorizedController < ApplicationController
  skip_before_action :verify_authenticity_token

  def self.call(env)
    @respond ||= action(:respond)
    @respond.call(env)
  end

  def respond
    head :unauthorized
  end
end
