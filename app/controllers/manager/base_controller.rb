class Manager::BaseController < ApplicationController
  def block_authenticated_manager!
    redirect_to manager_tickets_path if authenticator.signed_in?(scope: :manager)
  end

  def authenticate_manager!
    redirect_to manager_root_path unless authenticator.signed_in?(scope: :manager)
  end
end
