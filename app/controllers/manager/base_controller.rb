class Manager::BaseController < ApplicationController
  private

  def block_authenticated_manager!
    redirect_to manager_tickets_path if authenticator.signed_in?(scope: :manager)
  end

  def authenticate_manager!
    redirect_to manager_root_path unless authenticator.signed_in?(scope: :manager)
  end

  # trailblazer's callback
  def _run_options(options)
    options.merge('current_manager' => authenticator.current_user(scope: :manager))
  end
end
