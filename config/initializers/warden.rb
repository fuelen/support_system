require 'warden'
Rails.configuration.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |config|
  config.default_strategies :password
  config.failure_app = UnauthorizedController
  Warden::Manager.serialize_into_session do |record|
    { 'model' => record.class.name, 'id' => record.id }
  end

  Warden::Manager.serialize_from_session do |record|
    record['model'].constantize.find_by(id: record['id'])
  end
end
