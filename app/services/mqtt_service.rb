# Make this into an object and use it on server startup in initializer

class MqttService

  def initialize
    @client = MQTT::Client.connect(
      :host => 'm2m.eclipse.org',
      :port => 1883
    )
  end

  def connect_to_broker
    @client.connect() do |c|
      c.get('test') do |topic, message|
        puts "#{topic}: #{message}"
      end
    end
  end
end
