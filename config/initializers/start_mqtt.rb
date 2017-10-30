Rails.application.config.after_initialize do
  MqttService.new.connect_to_broker
end
