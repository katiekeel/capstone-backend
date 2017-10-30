Rails.application.config.after_initialize do
  unless defined?(::Rails::Generators) || defined?(::Rails::Console) || File.basename($0) =='rake' || ENV['RAILS_ENV'] ||= 'test'
      MqttService.new.connect_to_broker
  end
end
