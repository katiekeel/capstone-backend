Rails.application.config.after_initialize do
  unless defined?(::Rails::Generators) || defined?(::Rails::Console) || ENV['RAILS_ENV'] == 'test' || defined?(is_running_migration?) && is_running_migration?
      MqttService.new.connect_to_broker
  end
end
