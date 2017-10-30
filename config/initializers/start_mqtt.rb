Rails.application.config.after_initialize do
  unless defined?(::Rails::Generators) || ENV['RAILS_ENV'] == 'test'
      MqttService.new.connect_to_broker
  end
end
