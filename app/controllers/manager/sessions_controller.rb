class Manager
  class SessionsController < BaseController
    before_action :block_authenticated_manager!, only: %i[new create]
    before_action :authenticate_manager!, only: :destroy

    def new
      run Session::Build
      render_concept(Session::Cell::New)
    end

    def create
      run Session::Create do
        authenticator.sign_in!(@model, scope: :manager)
        return redirect_to manager_tickets_path
      end
      render_concept(Session::Cell::New)
    end

    def destroy
      authenticator.sign_out!(scope: :manager)
      redirect_to manager_root_path
    end
  end
end
