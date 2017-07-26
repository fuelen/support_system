class Authenticator
  def initialize(warden)
    @warden = warden
  end

  attr_accessor :warden

  def current_user(options = {})
    warden.user(options[:scope] || :default)
  end

  def signed_in?(options = {})
    current_user(options).present?
  end

  def sign_in!(user, options = {})
    warden.set_user(user, scope: options[:scope] || :default)
  end

  def sign_out!(options = {})
    warden.logout(options[:scope] || :default)
  end
end
