RSpec.configure do |c|
  c.include Warden::Test::ControllerHelpers, type: :controller

  def sign_in(user, scope = :default)
    warden.set_user(user, scope: scope)
  end

  def signed_user(scope = :default)
    warden.user(scope)
  end
end
