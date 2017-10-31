class MqttService

  def initialize
    @client = MQTT::Client.new({
      :remote_host => 'm2m.eclipse.org',
      :remote_port => 1883,
      :reconnect => true
    })
  end

  def connect_to_broker
    @client.connect()
    subscribe
    receive
  end

  def subscribe
    @client.subscribe('DCML01')
    @client.subscribe('DCML02')
    @client.subscribe('weatherstation_onqal/temperature_outside')
    @client.subscribe('tom2white/home/garden5/0')
  end

  def receive
    Thread.new do
      @client.get do |tank, level|
        puts "#{tank}: #{level}"
        Tank.from_mqtt(tank, level)
      end
    end
  end

end
