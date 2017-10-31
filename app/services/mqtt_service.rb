class MqttService

  def initialize
    @client = MQTT::Client.connect(
      :host => 'm2m.eclipse.org',
      :port => 1883,
    )
  end

  def connect_to_broker
    @client.connect(
      :keep_alive => 0
    )
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
