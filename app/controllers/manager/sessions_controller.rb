class Manager
  class SessionsController < BaseController
    before_action :block_authenticated_manager!, only: %i[new create]
    before_action :authenticate_manager!, only: :destroy

    def new
      run Session::Build
      render concept(Session::Cell::New, OpenStruct.new(contract: @form))
    end

    def create
      run Session::Create do
        authenticator.sign_in!(@model, scope: :manager)
        return redirect_to manager_tickets_path
      end
      render concept(Session::Cell::New, OpenStruct.new(contract: @form))
    end

    def destroy
      authenticator.sign_out!(scope: :manager)
      redirect_to manager_root_path
    end
  end
end
